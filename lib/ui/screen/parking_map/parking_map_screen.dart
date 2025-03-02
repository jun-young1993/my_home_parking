import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:my_home_parking/core/constants/app_constants.dart';
import 'package:my_home_parking/core/enums/object_type.dart';

// 전역 서버 인스턴스 생성

class ParkingMapScreen extends StatefulWidget {
  const ParkingMapScreen({super.key});

  @override
  State<ParkingMapScreen> createState() => _ParkingMapScreenState();
}

class _ParkingMapScreenState extends State<ParkingMapScreen> {
  final GlobalKey webViewKey = GlobalKey();
  InAppWebViewController? webViewController;
  InAppWebViewSettings settings = InAppWebViewSettings(
    isInspectable: kDebugMode,
  );
  PullToRefreshController? pullToRefreshController;
  PullToRefreshSettings pullToRefreshSettings = PullToRefreshSettings(
    color: Colors.blue,
  );
  bool pullToRefreshEnabled = true;

  void _sendObjectSelectionToWeb(Object3DType objectType) {
    final message = {
      'type': 'objectSelection',
      'data': {'objectType': objectType.value},
    };

    webViewController?.evaluateJavascript(
      source: 'window.postMessage(${jsonEncode(message)}, "*")',
    );
  }

  @override
  void initState() {
    pullToRefreshController =
        kIsWeb
            ? null
            : PullToRefreshController(
              settings: pullToRefreshSettings,
              onRefresh: () async {
                if (defaultTargetPlatform == TargetPlatform.android) {
                  webViewController?.reload();
                } else if (defaultTargetPlatform == TargetPlatform.iOS) {
                  webViewController?.loadUrl(
                    urlRequest: URLRequest(
                      url: await webViewController?.getUrl(),
                    ),
                  );
                }
              },
            );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () async {
            if (mounted) {
              Navigator.of(context).pop();
            }
          },
        ),
        actions: [
          TextButton(
            onPressed: () async {
              pullToRefreshEnabled = !pullToRefreshEnabled;
              await pullToRefreshController?.setEnabled(pullToRefreshEnabled);
              setState(() {});
            },
            style: TextButton.styleFrom(foregroundColor: Colors.blue),
            child: Text(pullToRefreshEnabled ? 'Disable' : 'Enable'),
          ),
        ],
        title: const Text(
          '주차장 지도1',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          _buildObjectSelectionBar(),
          Expanded(
            child: SafeArea(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                ),
                child: InAppWebView(
                  key: webViewKey,
                  initialSettings: settings,
                  pullToRefreshController: pullToRefreshController,
                  initialUrlRequest: URLRequest(
                    url: WebUri(AppConstants.localHostUrl),
                  ),
                  onWebViewCreated: (InAppWebViewController controller) {
                    webViewController = controller;
                  },
                  onLoadStop: (controller, url) {
                    pullToRefreshController?.endRefreshing();
                  },
                  onReceivedError: (controller, request, error) {
                    pullToRefreshController?.endRefreshing();
                  },
                  onProgressChanged: (controller, progress) {
                    if (progress == 100) {
                      pullToRefreshController?.endRefreshing();
                    }
                  },
                  onConsoleMessage: (controller, consoleMessage) {
                    print(
                      'Web Console: [${consoleMessage.messageLevel}] '
                      '${consoleMessage.message}',
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildObjectSelectionBar() {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children:
            Object3DType.values.map((objectType) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ObjectSelectionButton(
                  objectType: objectType,
                  onSelected: () {
                    _sendObjectSelectionToWeb(objectType);
                  },
                ),
              );
            }).toList(),
      ),
    );
  }
}

class ObjectSelectionButton extends StatelessWidget {
  final Object3DType objectType;
  final VoidCallback onSelected;

  const ObjectSelectionButton({
    super.key,
    required this.objectType,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onSelected,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(_getDisplayName(objectType)),
    );
  }

  String _getDisplayName(Object3DType type) {
    switch (type) {
      case Object3DType.pillar:
        return '기둥';
      case Object3DType.house:
        return '집';
      case Object3DType.car:
        return '차량';
      case Object3DType.parkingSpace:
        return '주차공간';
    }
  }
}

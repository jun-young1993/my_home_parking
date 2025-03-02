import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:my_home_parking/core/constants/app_constants.dart';
import 'package:my_home_parking/core/enums/object_type.dart';
import 'package:my_home_parking/state/parking_map/parking_map_bloc.dart';
import 'package:my_home_parking/state/parking_map/parking_map_event.dart';
import 'package:my_home_parking/state/parking_map/parking_map_state.dart';
import 'package:my_home_parking/ui/screen/parking_map/components/object_selection_button.dart';

// 전역 서버 인스턴스 생성

class ParkingMapScreen extends StatefulWidget {
  const ParkingMapScreen({super.key});

  @override
  State<ParkingMapScreen> createState() => _ParkingMapScreenState();
}

class _ParkingMapScreenState extends State<ParkingMapScreen> {
  final GlobalKey webViewKey = GlobalKey();
  InAppWebViewController? webViewController;
  final InAppWebViewSettings settings = InAppWebViewSettings(
    isInspectable: kDebugMode,
  );
  PullToRefreshController? pullToRefreshController;
  final PullToRefreshSettings pullToRefreshSettings = PullToRefreshSettings(
    color: Colors.blue,
  );
  // ParkingMapBloc 인스턴스에 접근하기 위한 getter 메서드
  // context.read<T>(): BuildContext의 확장 메서드로 Provider 트리에서 가장 가까운 T 타입의 인스턴스를 찾아 반환
  // - context: 현재 위젯의 BuildContext 객체
  // - read(): Provider에서 한 번만 값을 읽을 때 사용 (상태 변화 감지 X)
  // - watch()와 달리 UI를 다시 빌드하지 않음
  // 반환값: Provider에서 제공하는 ParkingMapBloc 인스턴스
  ParkingMapBloc get parkingMapBloc => context.read<ParkingMapBloc>();

  @override
  void initState() {
    super.initState();
    _initializePullToRefresh();
  }

  void _initializePullToRefresh() {
    if (!kIsWeb) {
      pullToRefreshController = PullToRefreshController(
        settings: pullToRefreshSettings,
        onRefresh: _handleRefresh,
      );
    }
  }

  Future<void> _handleRefresh() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      await webViewController?.reload();
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      final currentUrl = await webViewController?.getUrl();
      if (currentUrl != null) {
        await webViewController?.loadUrl(
          urlRequest: URLRequest(url: currentUrl),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildObjectSelectionBar(),
          Expanded(child: _buildWebView()),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: const Text(
        '주차장 지도',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
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
                    parkingMapBloc.add(
                      AddObject(webViewController!, objectType),
                    );
                  },
                ),
              );
            }).toList(),
      ),
    );
  }

  Widget _buildWebView() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
        child: InAppWebView(
          key: webViewKey,
          initialSettings: settings,
          pullToRefreshController: pullToRefreshController,
          initialUrlRequest: URLRequest(url: WebUri(AppConstants.localHostUrl)),
          onWebViewCreated: (controller) => webViewController = controller,
          onLoadStop: (_, __) => pullToRefreshController?.endRefreshing(),
          onReceivedError:
              (_, __, ___) => pullToRefreshController?.endRefreshing(),
          onProgressChanged: (_, progress) {
            if (progress == 100) {
              pullToRefreshController?.endRefreshing();
            }
          },
          onConsoleMessage: (_, consoleMessage) {
            if (kDebugMode) {
              print(
                'Web Console: [${consoleMessage.messageLevel}] '
                '${consoleMessage.message}',
              );
            }
          },
        ),
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'dart:io' show Platform;

class ParkingMapScreen extends StatefulWidget {
  const ParkingMapScreen({super.key});

  @override
  State<ParkingMapScreen> createState() => _ParkingMapScreenState();
}

class _ParkingMapScreenState extends State<ParkingMapScreen> {
  Future<String> localLoader() async {
    return await rootBundle.loadString('assets/web/index.html');
  }

  late InAppWebViewController _webViewController;
  String url = "";
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
        child: InAppWebView(
          initialOptions: InAppWebViewGroupOptions(),
          // initialUrlRequest: URLRequest(url: WebUri("http://localhost:9999/")),
          initialFile: 'assets/web/index.html',
          onWebViewCreated: (controller) => _webViewController = controller,
          onProgressChanged: (controller, progress) {
            if (mounted) setState(() => this.progress = progress / 100);
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _webViewController.dispose();
    super.dispose();
  }
}

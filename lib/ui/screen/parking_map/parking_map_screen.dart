import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// 전역 서버 인스턴스 생성

class ParkingMapScreen extends StatefulWidget {
  const ParkingMapScreen({super.key});

  @override
  State<ParkingMapScreen> createState() => _ParkingMapScreenState();
}

class _ParkingMapScreenState extends State<ParkingMapScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
        child: InAppWebView(
          initialSettings: InAppWebViewSettings(isInspectable: kDebugMode),
          initialUrlRequest: URLRequest(url: WebUri('http://localhost:8080')),
          onWebViewCreated: (controller) {},
          onLoadStart: (controller, url) {},
          onLoadStop: (controller, url) {},
        ),
      ),
    );
  }
}

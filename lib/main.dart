import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:my_home_parking/core/di/bloc_provider.dart';
import 'package:my_home_parking/core/di/fcm_sender.dart';
import 'package:my_home_parking/core/di/firebase_messaging_wrapper.dart';
import 'package:my_home_parking/core/di/repository_provider.dart';
import 'package:my_home_parking/firebase_options.dart';
import 'package:my_home_parking/core/constants/app_constants.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeago/timeago.dart' as timeago;

final InAppLocalhostServer localhostServer = InAppLocalhostServer(
  documentRoot: 'assets/web',
  port: AppConstants.localPort,
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  // Firebase 초기화
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Firebase Messaging 초기화
  await FirebaseMessagingWrapper.initialize();
  FCMSender.initializeFCM();
  // SharedPreferences 인스턴스 초기화
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  // timeago 한국어 설정 초기화
  timeago.setLocaleMessages('ko', timeago.KoMessages());

  if (!kIsWeb) {
    // start the localhost server
    debugPrint("Starting localhost server");
    await localhostServer.start();
  }

  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
    await InAppWebViewController.setWebContentsDebuggingEnabled(kDebugMode);
  }

  _initializeLocalNotifications();

  runApp(
    RepositoryProviderWrapper(
      prefs: prefs,
      child: const BlocProviderWrapper(),
    ),
  );
}

void _initializeLocalNotifications() async {
  if (await Permission.notification.isDenied &&
      !await Permission.notification.isPermanentlyDenied) {
    await [Permission.notification].request();
  }

  final FlutterLocalNotificationsPlugin local =
      FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings android =
      const AndroidInitializationSettings("@mipmap/ic_launcher");
  DarwinInitializationSettings ios = const DarwinInitializationSettings(
    requestSoundPermission: false,
    requestBadgePermission: false,
    requestAlertPermission: false,
  );
  InitializationSettings settings =
      InitializationSettings(android: android, iOS: ios);
  await local.initialize(settings);
}

import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:my_home_parking/app.dart';
import 'package:my_home_parking/firebase_options.dart';
import 'package:my_home_parking/repository/log_repository.dart';
import 'package:my_home_parking/repository/main_repository.dart';
import 'package:my_home_parking/repository/my_car_repository.dart';
import 'package:my_home_parking/repository/notice_repository.dart';
import 'package:my_home_parking/repository/parking_map_repository.dart';
import 'package:my_home_parking/state/log/log_bloc.dart';
import 'package:my_home_parking/state/log/log_event.dart';
import 'package:my_home_parking/state/main/main_bloc.dart';
import 'package:my_home_parking/core/constants/app_constants.dart';
import 'package:my_home_parking/state/main/main_state.dart';
import 'package:my_home_parking/state/notice/notice_bloc.dart';
import 'package:my_home_parking/state/parking_map/parking_map_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeago/timeago.dart' as timeago;

final InAppLocalhostServer localhostServer = InAppLocalhostServer(
  documentRoot: 'assets/web',
  port: AppConstants.localPort,
);
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('onBackgroundMessage: $message');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    String payloadData = jsonEncode(message.data);
    print('onMessage: $payloadData');
  });
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print('fcmToken: $fcmToken');
  // SharedPreferences 인스턴스 초기화
  final prefs = await SharedPreferences.getInstance();

  // timeago 한국어 설정 초기화
  timeago.setLocaleMessages('ko', timeago.KoMessages());

  if (!kIsWeb) {
    // start the localhost server
    print("Starting localhost server");
    await localhostServer.start();
  }

  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
    await InAppWebViewController.setWebContentsDebuggingEnabled(kDebugMode);
  }
  _initializeLocalNotifications();
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<MainRepository>(
          create: (context) => MainDefaultRepository(prefs),
        ),
        RepositoryProvider<ParkingMapRepository>(
          create: (context) => ParkingMapDefaultRepository(),
        ),
        RepositoryProvider<MyCarRepository>(
          create: (context) => MyCarDefaultRepository(),
        ),
        RepositoryProvider<NoticeRepository>(
          create: (context) => NoticeDefaultRepository(),
        ),
        RepositoryProvider<LogRepository>(
          create: (context) => LogDefaultRepository(),
        ),
      ],
      child: Builder(
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => MainBloc(
                context.read<MainRepository>(),
                context.read<MyCarRepository>(),
              ),
            ),
            BlocProvider(
              create: (context) =>
                  ParkingMapBloc(context.read<ParkingMapRepository>()),
            ),
            BlocProvider(
              create: (context) => NoticeBloc(
                context.read<NoticeRepository>(),
                context.read<MainBloc>().state,
              ),
            ),
            BlocProvider(
              create: (context) => LogBloc(
                context.read<LogRepository>(),
                context.read<MainBloc>().state,
              ),
            ),
          ],
          child: MultiBlocListener(listeners: [
            BlocListener<MainBloc, MainState>(
              listenWhen: (previous, current) =>
                  previous.userInfo?.carNumber?.isParked !=
                  current.userInfo?.carNumber?.isParked,
              listener: (context, state) {
                context.read<LogBloc>().add(const LogEvent.getLogs());
              },
            )
          ], child: const MyApp()),
        ),
      ),
    ),
  );
}

void _initializeLocalNotifications() async {
  if (await Permission.notification.isDenied &&
      !await Permission.notification.isPermanentlyDenied) {
    await [Permission.notification].request();
  }

  final FlutterLocalNotificationsPlugin _local =
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
  await _local.initialize(settings);
}

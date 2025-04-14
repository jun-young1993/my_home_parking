import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseMessagingWrapper {
  static final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    // 로컬 알림 초기화
    await _initializeLocalNotifications();

    // 백그라운드 메시지 핸들러 설정
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // 앱이 종료된 상태에서 알림을 탭하여 앱이 열릴 때
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _handleMessage(message, isFromBackground: true);
    });

    // 포그라운드 메시지 처리
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _handleMessage(message, isFromBackground: false);
    });

    // FCM 토큰 가져오기
    final String? fcmToken = await FirebaseMessaging.instance.getToken();
    debugPrint('fcmToken: $fcmToken');
  }

  static Future<void> _initializeLocalNotifications() async {
    const AndroidInitializationSettings android =
        AndroidInitializationSettings("@mipmap/ic_launcher");
    const DarwinInitializationSettings ios = DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );
    const InitializationSettings settings =
        InitializationSettings(android: android, iOS: ios);
    await _localNotifications.initialize(settings);
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    debugPrint('onBackgroundMessage: $message');

    // 백그라운드에서 알림 표시
    await _showNotification(
      title: message.notification?.title ?? '알림',
      body: message.notification?.body ?? '',
      payload: message.data.toString(),
    );
  }

  static void _handleMessage(RemoteMessage message,
      {required bool isFromBackground}) {
    if (message.notification != null) {
      debugPrint('onMessage: ${message.notification?.title}');
      debugPrint('onMessage: ${message.notification?.body}');
      debugPrint('onMessage: ${message.data['click_action']}');

      // 포그라운드에서 알림 표시
      if (!isFromBackground) {
        _showNotification(
          title: message.notification?.title ?? '알림',
          body: message.notification?.body ?? '',
          payload: message.data.toString(),
        );
      }
    }
    debugPrint('onMessage: ${message.data}');
  }

  static Future<void> _showNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'default_channel',
      '기본 채널',
      channelDescription: '기본 알림 채널',
      importance: Importance.high,
      priority: Priority.high,
    );

    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _localNotifications.show(
      0, // 알림 ID
      title,
      body,
      platformDetails,
      payload: payload,
    );
  }
}

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:my_home_parking/core/constants/app_constants.dart';

class FCMSender {
  static Future<String> getToken() async {
    try {
      final token = await FirebaseMessaging.instance.getToken();
      if (token == null) {
        throw Exception('FCM 토큰이 없습니다.');
      }
      debugPrint('FCM 토큰: $token');
      return token;
    } catch (e) {
      debugPrint('FCM 토큰 가져오기 실패: $e');
      rethrow;
    }
  }

  static Future<void> deleteToken() async {
    try {
      await FirebaseMessaging.instance.deleteToken();
      debugPrint('FCM 토큰 삭제 성공');
    } catch (e) {
      debugPrint('FCM 토큰 삭제 실패: $e');
      rethrow;
    }
  }

  static Future<void> subscribeToTopic(String topic) async {
    try {
      await FirebaseMessaging.instance.subscribeToTopic(topic);
      debugPrint('토픽 구독 성공: $topic');
    } catch (e) {
      debugPrint('토픽 구독 실패: $e');
      rethrow;
    }
  }

  static Future<void> unsubscribeFromTopic(String topic) async {
    try {
      await FirebaseMessaging.instance.unsubscribeFromTopic(topic);
      debugPrint('토픽 구독 취소 성공: $topic');
    } catch (e) {
      debugPrint('토픽 구독 취소 실패: $e');
      rethrow;
    }
  }

  static Future<void> requestPermission() async {
    try {
      final settings = await FirebaseMessaging.instance.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      debugPrint('알림 권한 상태: ${settings.authorizationStatus}');
    } catch (e) {
      debugPrint('알림 권한 요청 실패: $e');
      rethrow;
    }
  }

  static void initializeFCM() async {
    await FCMSender.requestPermission();
    await FCMSender.getToken();
    await FCMSender.subscribeToTopic(AppConstants.fcmTopic);
  }
}

import 'package:flutter/material.dart';
import 'package:my_home_parking/ui/screen/main/main_screen.dart';
import 'package:my_home_parking/ui/screen/parking_log/parking_log_screen.dart';
import 'package:my_home_parking/ui/screen/parking_map/parking_map_screen.dart';
import 'package:my_home_parking/ui/screen/parking_notice/parking_notice_create_screen.dart';
import 'package:my_home_parking/ui/screen/parking_notice/parking_notice_detail_screen.dart';
import 'package:my_home_parking/ui/screen/parking_notice/parking_notice_screen.dart';
import 'package:my_home_parking/ui/screen/parking_status/parking_status_screen.dart';
import 'package:my_home_parking/ui/screen/setting/setting_screen.dart';
import 'package:flutter_common/flutter_common.dart';

// class FadeRoute extends PageRouteBuilder {
//   FadeRoute({required this.page})
//       : super(
//           pageBuilder: (_, __, ___) => page,
//           transitionsBuilder: (_, animation, __, child) => FadeTransition(
//             opacity: animation,
//             child: Scaffold(body: child),
//           ),
//         );

//   final Widget page;
// }

enum Routes {
  main,
  parkingMap,
  setting,
  parkingStatus,
  parkingNotice,
  parkingNoticeDetail,
  parkingNoticeCreate,
  parkingLog,
}

class _Paths {
  static const String main = 'main';
  static const String parkingMap = 'parkingMap';
  static const String setting = 'setting';
  static const String parkingStatus = 'parkingStatus';
  static const String parkingNotice = 'parkingNotice';
  static const String parkingNoticeDetail = 'parkingNoticeDetail';
  static const String parkingNoticeCreate = 'parkingNoticeCreate';
  static const String parkingLog = 'parkingLog';
  static const Map<Routes, String> _pathMap = {
    Routes.main: _Paths.main,
    Routes.parkingMap: _Paths.parkingMap,
    Routes.setting: _Paths.setting,
    Routes.parkingStatus: _Paths.parkingStatus,
    Routes.parkingNotice: _Paths.parkingNotice,
    Routes.parkingNoticeDetail: _Paths.parkingNoticeDetail,
    Routes.parkingNoticeCreate: _Paths.parkingNoticeCreate,
    Routes.parkingLog: _Paths.parkingLog,
  };

  static String of(Routes route) => _pathMap[route] ?? main;
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {
    AppNavigator.currentRoute = settings.name;
    switch (settings.name) {
      case _Paths.main:
        return FadeRoute(page: const MainScreen());
      case _Paths.parkingMap:
        return FadeRoute(page: const ParkingMapScreen());
      case _Paths.setting:
        return FadeRoute(page: const SettingScreen());
      case _Paths.parkingStatus:
        return FadeRoute(page: const ParkingStatusScreen());
      case _Paths.parkingNotice:
        return FadeRoute(page: const ParkingNoticeScreen());
      case _Paths.parkingNoticeDetail:
        return FadeRoute(
            page: ParkingNoticeDetailScreen(
                noticeId: settings.arguments as String));
      case _Paths.parkingNoticeCreate:
        return FadeRoute(page: const ParkingNoticeCreateScreen());
      case _Paths.parkingLog:
        return FadeRoute(page: const ParkingLogScreen());
      default:
        return FadeRoute(page: const MainScreen());
    }
  }

  static Future? push<T>(Routes route, [T? arguments]) =>
      state?.pushNamed(_Paths.of(route), arguments: arguments);

  static Future? replaceWith<T>(Routes route, [T? arguments]) =>
      state?.pushReplacementNamed(_Paths.of(route), arguments: arguments);

  static void pop() => state?.pop();

  static NavigatorState? get state => navigatorKey.currentState;

  static String? currentRoute;
}

import 'package:flutter/material.dart';
import 'package:my_home_parking/ui/screen/main/main_screen.dart';
import 'package:my_home_parking/ui/screen/parking_map/parking_map_screen.dart';

class FadeRoute extends PageRouteBuilder {
  FadeRoute({required this.page})
    : super(
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder:
            (_, animation, __, child) => FadeTransition(
              opacity: animation,
              child: Scaffold(body: child),
            ),
      );

  final Widget page;
}

enum Routes { main, parkingMap }

class _Paths {
  static const String main = 'main';
  static const String parkingMap = 'parkingMap';
  static const Map<Routes, String> _pathMap = {
    Routes.main: _Paths.main,
    Routes.parkingMap: _Paths.parkingMap,
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

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:my_home_parking/app.dart';
import 'package:my_home_parking/repository/main_repository.dart';
import 'package:my_home_parking/repository/my_car_repository.dart';
import 'package:my_home_parking/repository/parking_map_repository.dart';
import 'package:my_home_parking/state/main/main_bloc.dart';
import 'package:my_home_parking/core/constants/app_constants.dart';
import 'package:my_home_parking/state/parking_map/parking_map_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final InAppLocalhostServer localhostServer = InAppLocalhostServer(
  documentRoot: 'assets/web',
  port: AppConstants.localPort,
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // SharedPreferences 인스턴스 초기화
  final prefs = await SharedPreferences.getInstance();

  if (!kIsWeb) {
    // start the localhost server
    print("Starting localhost server");
    await localhostServer.start();
  }

  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
    await InAppWebViewController.setWebContentsDebuggingEnabled(kDebugMode);
  }
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
      ],
      child: MultiBlocProvider(
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
        ],
        child: const MyApp(),
      ),
    ),
  );
}

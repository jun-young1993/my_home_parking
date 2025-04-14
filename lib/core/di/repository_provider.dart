import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_home_parking/repository/log_repository.dart';
import 'package:my_home_parking/repository/main_repository.dart';
import 'package:my_home_parking/repository/my_car_repository.dart';
import 'package:my_home_parking/repository/notice_repository.dart';
import 'package:my_home_parking/repository/parking_map_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RepositoryProviderWrapper extends StatelessWidget {
  final Widget child;
  final SharedPreferences prefs;

  const RepositoryProviderWrapper({
    super.key,
    required this.child,
    required this.prefs,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
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
      child: child,
    );
  }
}

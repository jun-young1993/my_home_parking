import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_common/state/app_config/app_config_bloc.dart';
import 'package:my_home_parking/repository/log_repository.dart';
import 'package:my_home_parking/repository/main_repository.dart';
import 'package:my_home_parking/repository/my_car_repository.dart';
import 'package:my_home_parking/repository/notice_repository.dart';
import 'package:my_home_parking/repository/parking_map_repository.dart';
import 'package:my_home_parking/state/log/log_bloc.dart';
import 'package:my_home_parking/state/log/log_event.dart';
import 'package:my_home_parking/state/main/main_bloc.dart';
import 'package:my_home_parking/state/main/main_state.dart';
import 'package:my_home_parking/state/notice/notice_bloc.dart';
import 'package:my_home_parking/state/parking_map/parking_map_bloc.dart';
import 'package:my_home_parking/app.dart';

class BlocProviderWrapper extends StatelessWidget {
  const BlocProviderWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppConfigBloc(),
        ),
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
              context.read<NoticeRepository>(), context.read<MainRepository>()),
        ),
        BlocProvider(
          create: (context) => LogBloc(
            context.read<LogRepository>(),
            context.read<MainRepository>(),
          ),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<MainBloc, MainState>(
            listenWhen: (previous, current) =>
                previous.userInfo?.carNumber?.isParked !=
                current.userInfo?.carNumber?.isParked,
            listener: (context, state) {
              context.read<LogBloc>().add(const LogEvent.getLogs());
            },
          )
        ],
        child: const MyApp(),
      ),
    );
  }
}

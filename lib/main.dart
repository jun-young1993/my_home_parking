import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_home_parking/app.dart';
import 'package:my_home_parking/repository/main_repository.dart';
import 'package:my_home_parking/state/main/main_bloc.dart';

Future<void> main() async {
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<MainRepository>(
          create: (context) => MainDefaultRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MainBloc(context.read<MainRepository>()),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

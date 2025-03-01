import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:my_home_parking/app.dart';
import 'package:my_home_parking/repository/main_repository.dart';
import 'package:my_home_parking/state/main/main_bloc.dart';

final InAppLocalhostServer localhostServer = InAppLocalhostServer(
  documentRoot: 'assets/web',
);
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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

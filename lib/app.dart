import 'package:flutter/material.dart';
import 'package:my_home_parking/core/constants/app_constants.dart';
import 'package:my_home_parking/routes.dart';
import 'package:my_home_parking/ui/screen/home/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      navigatorKey: AppNavigator.navigatorKey,
      onGenerateRoute: AppNavigator.onGenerateRoute,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // builder: (context, child) {
      //   return MediaQuery(
      //     data: MediaQuery.of(context).copyWith(
      //       devicePixelRatio: MediaQuery.of(context).devicePixelRatio,
      //       textScaler: const TextScaler.linear(1.0),
      //     ),
      //     child: SizedBox(
      //       width: MediaQuery.of(context).size.width,
      //       height: MediaQuery.of(context).size.height,
      //       child: child!,
      //     ),
      //   );
      // },
      home: const HomeScreen(),
    );
  }
}

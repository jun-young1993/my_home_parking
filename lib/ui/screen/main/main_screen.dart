import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_home_parking/core/constants/app_constants.dart';
import 'package:my_home_parking/exceptions/app_exception.dart';
import 'package:my_home_parking/model/user_info.dart';
import 'package:my_home_parking/state/main/main_bloc.dart';
import 'package:my_home_parking/state/main/main_event.dart';
import 'package:my_home_parking/state/main/main_selector.dart';
import 'package:my_home_parking/ui/screen/main/sections/main_menu_section.dart';
import 'package:my_home_parking/ui/screen/main/sections/registration/user_info/car_number_section.dart';
import 'package:my_home_parking/ui/screen/main/sections/registration/user_info/post_adress_section.dart';
import 'package:my_home_parking/ui/widgets/error_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainBloc get mainBloc => context.read<MainBloc>();

  @override
  void initState() {
    super.initState();
    mainBloc.add(const MainEvent.checkUserInfo());
  }

  void _onRetry() {
    mainBloc.add(const MainEvent.clearError());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.appName),
      ),
      body: ExceptionSelector(
        (exception) {
          print("exception$exception");
          if (exception is AppException) {
            return exception.when(
              timeout: () => ErrorView(error: exception, onRetry: _onRetry),
              network: (message) =>
                  ErrorView(error: exception, onRetry: _onRetry),
              badRequest: (message) =>
                  ErrorView(error: exception, onRetry: _onRetry),
              unauthorized: () =>
                  ErrorView(error: exception, onRetry: _onRetry),
              forbidden: () => ErrorView(error: exception, onRetry: _onRetry),
              cancelled: () => ErrorView(error: exception, onRetry: _onRetry),
              notFound: () => ErrorView(error: exception, onRetry: _onRetry),
              server: (message) =>
                  ErrorView(error: exception, onRetry: _onRetry),
              invalidUserInfo: () =>
                  ErrorView(error: exception, onRetry: _onRetry),
              userInfoSave: () =>
                  ErrorView(error: exception, onRetry: _onRetry),
              invalidCarNumber: () =>
                  ErrorView(error: exception, onRetry: _onRetry),
              webView: () => ErrorView(error: exception, onRetry: _onRetry),
              unknown: (message) =>
                  ErrorView(error: exception, onRetry: _onRetry),
              notFoundUserInfo: () => PostAddressSection(
                onSubmit: (data) {
                  mainBloc.add(MainEvent.saveUserInfo(
                    UserInfo(
                      address: data.address,
                      zoneCode: data.zoneCode,
                    ),
                  ));
                },
              ),
              notFoundCarNumber: () => CarNumberSection(
                onBack: _onRetry,
                // onSubmit: (d_buildParkingNoticeSectionata) {
                //   print(data);
                // mainBloc.add(MainEvent.saveUserInfo(
                //   UserInfo(
                //     carNumber: data.carNumber,
                //   ),
                // ));
                // },
              ),
            );
          } else {
            return UserInfoSelector((userInfo) {
              return const MainMenuSection();
            });
          }
        },
      ),
    );
  }
}

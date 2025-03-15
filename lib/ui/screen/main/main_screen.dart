import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  @override
  Widget build(BuildContext context) {
    return ExceptionSelector(
      (exception) {
        print("exception$exception");
        if (exception is AppException) {
          return exception.when(
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
              onBack: () {
                mainBloc.add(const MainEvent.clearError());
              },
              // onSubmit: (data) {
              //   print(data);
              // mainBloc.add(MainEvent.saveUserInfo(
              //   UserInfo(
              //     carNumber: data.carNumber,
              //   ),
              // ));
              // },
            ),
            invalidUserInfo: () => ErrorView(error: exception),
            userInfoSave: () => ErrorView(error: exception),
            webView: () => ErrorView(error: exception),
            unknown: (message) => ErrorView(error: exception),
          );
        } else {
          return UserInfoSelector((userInfo) {
            return MainMenuSection(
              navigateToCarNumberInput: () {
                mainBloc.add(const MainEvent.checkCarNumber());
              },
            );
          });
        }
      },
    );
  }
}

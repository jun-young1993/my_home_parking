import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_home_parking/exceptions/app_exception.dart';
import 'package:my_home_parking/state/main/main_bloc.dart';
import 'package:my_home_parking/state/main/main_event.dart';
import 'package:my_home_parking/state/main/main_selector.dart';
import 'package:my_home_parking/ui/screen/main/sections/registration/user_info/post_adress_section.dart';
import 'package:my_home_parking/ui/screen/main/sections/registration_section.dart';
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
        if (exception is AppException) {
          return exception.when(
            notFoundUserInfo: () => PostAddressSection(
              onSubmit: (data) {
                print(data.toJson());
              },
            ),
            invalidUserInfo: () => ErrorView(error: exception),
            userInfoSave: () => ErrorView(error: exception),
            userInfoUpdate: () => ErrorView(error: exception),
            webView: () => ErrorView(error: exception),
            unknown: (message) => ErrorView(error: exception),
          );
        }
        return const RegistrationSection();
      },
    );
    // return UserInfoSelector(
    //   (userInfo) {
    //     if (userInfo == null) {
    //       return const RegistrationSection();
    //     }
    //     return const MainMenuSection();
    //   },
    // );
  }
  //   return BlocBuilder<MainBloc, MainState>(
  //     builder: (context, state) {
  //       if (state.isLoading) {
  //         return const Center(child: CircularProgressIndicator());
  //       }

  //       if (state.error) {
  //         return Center(
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               const Text('오류가 발생했습니다'),
  //               Text(state.errorMessage),
  //               ElevatedButton(
  //                 onPressed: () {
  //                   context.read<MainBloc>().add(
  //                         const MainEvent.checkUserInfo(),
  //                       );
  //                 },
  //                 child: const Text('다시 시도'),
  //               ),
  //             ],
  //           ),
  //         );
  //       }
  //       if (state.userInfo == null) {
  //         return const PostAddressSection();
  //       } else {}

  //       return state.userInfo == null
  //           ? const RegistrationSection()
  //           : const MainMenuSection();
  //     },
  //   );
  // }
}

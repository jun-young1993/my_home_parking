import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_home_parking/core/constants/app_constants.dart';
import 'package:my_home_parking/routes.dart';
import 'package:my_home_parking/state/main/main_bloc.dart';
import 'package:my_home_parking/state/main/main_event.dart';
import 'package:my_home_parking/state/main/main_selector.dart';
import 'package:my_home_parking/state/notice/notice_bloc.dart';
import 'package:my_home_parking/state/notice/notice_event.dart';
import 'package:my_home_parking/state/notice/notice_selector.dart';
import 'package:my_home_parking/ui/screen/parking_notice/sections/notice_list_section.dart';
import 'package:my_home_parking/ui/widgets/empty_screen.dart';
import 'package:my_home_parking/ui/widgets/error_view.dart';
import 'package:my_home_parking/ui/widgets/loading_overlay.dart';

class ParkingNoticeScreen extends StatefulWidget {
  const ParkingNoticeScreen({super.key});

  @override
  State<ParkingNoticeScreen> createState() => _ParkingNoticeScreenState();
}

class _ParkingNoticeScreenState extends State<ParkingNoticeScreen> {
  NoticeBloc get noticeBloc => context.read<NoticeBloc>();
  MainBloc get mainBloc => context.read<MainBloc>();
  final dateFormatter = DateFormat('yyyy-MM-dd HH:mm');

  @override
  void initState() {
    super.initState();
    noticeBloc.add(const NoticeEvent.getNotices());
  }

  void _onRetry() {
    noticeBloc.add(const NoticeEvent.clearError());
    AppNavigator.pop();
  }

  void _showCarNumberDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('차량번호 등록 필요'),
        content: const Text(
            '게시글을 작성하기 위해서는 차량번호 등록이 필요합니다.\n차량번호 등록 페이지로 이동하시겠습니까?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              mainBloc.add(const MainEvent.checkUserInfo());
            },
            child: const Text('확인'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppConstants.parkingNoticeMenuDisplayName),
        ),
        body: NoticeExceptionSelector((exception) {
          if (exception != null) {
            return ErrorView(
              error: exception,
              onRetry: _onRetry,
            );
          }
          return NoticeLoadingSelector((isLoading) {
            return LoadingOverlay(
                isLoading: isLoading,
                child: NoticesSelector((notices) {
                  if (notices.isEmpty) {
                    return EmptyScreen(
                      title: AppConstants.parkingNoticeEmptyTitle,
                      description: AppConstants.parkingNoticeEmptyDescription,
                      context: context,
                    );
                  }
                  return NoticeListSection(
                    notices: notices,
                    onNoticeTap: (notice) {
                      AppNavigator.push<String>(
                          Routes.parkingNoticeDetail, notice.id);
                    },
                  );
                }));
          });
        }),
        floatingActionButton: UserInfoSelector((userInfo) {
          if (userInfo?.carNumber == null) {
            return FloatingActionButton(
              onPressed: _showCarNumberDialog,
              child: const Icon(Icons.edit),
            );
          }
          return FloatingActionButton(
            onPressed: () {
              AppNavigator.push(Routes.parkingNoticeCreate);
            },
            child: const Icon(Icons.edit),
          );
        }));
  }
}

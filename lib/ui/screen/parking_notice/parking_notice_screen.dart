import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_home_parking/core/constants/app_constants.dart';
import 'package:my_home_parking/routes.dart';
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
        // 글쓰기 버튼
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            AppNavigator.push(Routes.parkingNoticeCreate);
          },
          child: const Icon(Icons.edit),
        ));
  }
}

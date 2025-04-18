import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_home_parking/core/constants/app_constants.dart';
import 'package:my_home_parking/routes.dart';
import 'package:my_home_parking/state/notice/notice_bloc.dart';
import 'package:my_home_parking/state/notice/notice_event.dart';
import 'package:my_home_parking/state/notice/notice_selector.dart';
import 'package:my_home_parking/ui/screen/parking_notice/sections/notice_create_section.dart';
import 'package:my_home_parking/ui/widgets/error_view.dart';
import 'package:my_home_parking/ui/widgets/loading_overlay.dart';

class ParkingNoticeCreateScreen extends StatefulWidget {
  const ParkingNoticeCreateScreen({super.key});

  @override
  State<ParkingNoticeCreateScreen> createState() =>
      _ParkingNoticeCreateScreenState();
}

class _ParkingNoticeCreateScreenState extends State<ParkingNoticeCreateScreen> {
  NoticeBloc get noticeBloc => context.read<NoticeBloc>();
  void _onRetry() {
    noticeBloc.add(const NoticeEvent.clearError());
    AppNavigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.parkingNoticeWriteButtonTitle),
      ),
      body: NoticeExceptionSelector(
        (exception) {
          if (exception != null) {
            return ErrorView(error: exception, onRetry: _onRetry);
          }
          return NoticeLoadingSelector((isLoading) {
            return LoadingOverlay(
                isLoading: isLoading,
                child: NoticeCreateSection(
                  onSubmit: (title, content, type) {
                    // TODO: 게시판 작성 로직 추가
                    noticeBloc
                        .add(NoticeEvent.createNotice(title, content, type));
                    AppNavigator.pop();
                  },
                ));
          });
        },
      ),
    );
  }
}

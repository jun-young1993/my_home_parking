import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_home_parking/core/constants/app_constants.dart';
import 'package:my_home_parking/exceptions/app_exception.dart';
import 'package:my_home_parking/routes.dart';
import 'package:my_home_parking/state/notice/notice_bloc.dart';
import 'package:my_home_parking/state/notice/notice_event.dart';
import 'package:my_home_parking/state/notice/notice_selector.dart';
import 'package:my_home_parking/ui/screen/parking_notice/sections/notice_detail_section.dart';
import 'package:my_home_parking/ui/widgets/error_view.dart';
import 'package:my_home_parking/ui/widgets/loading_overlay.dart';

class ParkingNoticeDetailScreen extends StatefulWidget {
  const ParkingNoticeDetailScreen({super.key, required this.noticeId});

  final String noticeId;

  @override
  State<ParkingNoticeDetailScreen> createState() =>
      _ParkingNoticeDetailScreenState();
}

class _ParkingNoticeDetailScreenState extends State<ParkingNoticeDetailScreen> {
  NoticeBloc get noticeBloc => context.read<NoticeBloc>();

  @override
  void initState() {
    super.initState();
    noticeBloc.add(NoticeEvent.getNotice(widget.noticeId));
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
        leading: IconButton(
          onPressed: () {
            AppNavigator.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: NoticeExceptionSelector((exception) {
        if (exception != null) {
          return ErrorView(error: exception, onRetry: _onRetry);
        }

        return NoticeLoadingSelector((isLoading) {
          return LoadingOverlay(
            isLoading: isLoading,
            child: NoticeDetailSelector((notice) {
              if (notice == null) {
                return const ErrorView(error: AppException.notFoundNotice());
              }

              return NoticeDetailSection(
                notice: notice,
                onSubmitReply: (content) {
                  noticeBloc
                      .add(NoticeEvent.createNoticeReply(notice.id, content));
                },
              );
            }),
          );
        });
      }),
    );
  }
}

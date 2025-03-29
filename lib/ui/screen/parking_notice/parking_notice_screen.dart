import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_home_parking/routes.dart';
import 'package:my_home_parking/state/notice/notice_bloc.dart';
import 'package:my_home_parking/state/notice/notice_event.dart';
import 'package:my_home_parking/state/notice/notice_selector.dart';
import 'package:my_home_parking/ui/screen/parking_notice/sections/notice_list_section.dart';
import 'package:my_home_parking/ui/widgets/error_view.dart';

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
          title: const Text('주차장 게시판'),
        ),
        body: NoticeExceptionSelector((exception) {
          if (exception != null) {
            return ErrorView(
              error: exception,
              onRetry: _onRetry,
            );
          }
          return NoticesSelector((notices) => NoticeListSection(
                notices: notices,
                onNoticeTap: (notice) {
                  
                },
              ));
        }),
        // 글쓰기 버튼
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // TODO: 글쓰기 화면으로 이동
          },
          icon: const Icon(Icons.edit),
          label: const Text('글쓰기'),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_common/widgets/dialogs/report_dialog.dart';
import 'package:flutter_common/widgets/ui/notice/notice_detail_wrapper.dart';
import 'package:intl/intl.dart';
import 'package:my_home_parking/model/notice/notice.dart';
import 'package:my_home_parking/ui/screen/parking_notice/sections/notice_reply_wrap_section.dart';

class NoticeDetailSection extends StatelessWidget {
  final Notice notice;
  final dateFormatter = DateFormat('yyyy-MM-dd HH:mm');
  final Function(String) onSubmitReply;
  final Function(ReportReason, String?) onReport;

  NoticeDetailSection({
    super.key,
    required this.notice,
    required this.onSubmitReply,
    required this.onReport,
  });

  void _showReportDialog(BuildContext context) {
    ReportDialog.show(
      context: context,
      onReport: onReport,
    );
  }

  @override
  Widget build(BuildContext context) {
    return NoticeDetailWrapper(notice: notice, onReport: onReport);
  }
}

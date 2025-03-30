import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_home_parking/model/notice/notice_reply.dart';

class NoticeReplySection extends StatelessWidget {
  final NoticeReply reply;
  final dateFormatter = DateFormat('yyyy-MM-dd HH:mm');

  NoticeReplySection({
    super.key,
    required this.reply,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 댓글 작성자 정보
          Row(
            children: [
              const Icon(
                Icons.person_outline,
                size: 16,
                color: Colors.grey,
              ),
              const SizedBox(width: 4),
              Text(
                reply.userName,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                dateFormatter.format(reply.createdAt),
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // 댓글 내용
          Text(
            reply.content,
            style: const TextStyle(
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

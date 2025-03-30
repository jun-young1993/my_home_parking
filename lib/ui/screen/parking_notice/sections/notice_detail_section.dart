import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_home_parking/model/notice/notice.dart';
import 'package:my_home_parking/state/notice/notice_event.dart';
import 'package:my_home_parking/ui/screen/parking_notice/sections/notice_reply_section.dart';
import 'package:my_home_parking/ui/screen/parking_notice/sections/notice_reply_wrap_section.dart';

class NoticeDetailSection extends StatelessWidget {
  final Notice notice;
  final dateFormatter = DateFormat('yyyy-MM-dd HH:mm');
  final Function(String) onSubmitReply;
  NoticeDetailSection({
    super.key,
    required this.notice,
    required this.onSubmitReply,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 제목 영역
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 공지사항 뱃지와 날짜
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        notice.type == 'NOTICE' ? '공지' : '일반',
                        style: TextStyle(
                          color: notice.type == 'NOTICE'
                              ? Colors.red
                              : Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      notice.createdAt != null
                          ? dateFormatter.format(notice.createdAt)
                          : '-',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // 제목
                Text(
                  notice.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                // 작성자 정보와 조회수
                Row(
                  children: [
                    const Icon(
                      Icons.person_outline,
                      size: 16,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      notice.userName,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Icon(
                      Icons.remove_red_eye_outlined,
                      size: 16,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '0', // view counter
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // 내용 영역 스타일링 추가
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey.shade200,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade100,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              notice.content,
              style: const TextStyle(
                fontSize: 16,
                height: 1.6,
              ),
            ),
          ),

          const SizedBox(height: 32),

          // 댓글 섹션 추가
          if (notice.noticeReplies?.isNotEmpty ?? false) ...[
            NoticeReplyWrapSection(
              replies: notice.noticeReplies ?? [],
              onSubmitReply: onSubmitReply,
            )
          ] else ...[
            // 댓글이 없는 경우
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Icon(
                    Icons.chat_bubble_outline,
                    size: 48,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '아직 댓글이 없습니다',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

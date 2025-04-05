import 'package:flutter/material.dart';
import 'package:my_home_parking/model/notice/notice_reply.dart';
import 'package:my_home_parking/ui/screen/parking_notice/sections/notice_reply_section.dart';

class NoticeReplyWrapSection extends StatefulWidget {
  final List<NoticeReply> replies;
  final Function(String) onSubmitReply;

  const NoticeReplyWrapSection({
    super.key,
    required this.replies,
    required this.onSubmitReply,
  });

  @override
  State<NoticeReplyWrapSection> createState() => _NoticeReplyWrapSectionState();
}

class _NoticeReplyWrapSectionState extends State<NoticeReplyWrapSection> {
  final _replyController = TextEditingController();

  @override
  void dispose() {
    _replyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildReplyCount(context),
        const SizedBox(height: 16),
        _buildReplyInputField(context),
        const SizedBox(height: 16),
        widget.replies.isEmpty
            ? _buildEmptyNoticeReply()
            : _buildReplyWrapSection(context),
      ],
    );
  }

  Widget _buildReplyCount(BuildContext context) {
    return Text(
      '댓글 ${widget.replies.length}개',
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildReplyInputField(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _replyController,
              decoration: const InputDecoration(
                hintText: '댓글을 입력하세요',
                border: InputBorder.none,
              ),
              maxLines: 1,
            ),
          ),
          TextButton(
            onPressed: () {
              if (_replyController.text.trim().isNotEmpty) {
                widget.onSubmitReply(_replyController.text);
                _replyController.clear();
              }
            },
            child: const Text('등록'),
          ),
        ],
      ),
    );
  }

  Widget _buildReplyWrapSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 댓글 목록
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.replies.length,
          separatorBuilder: (context, index) => const Divider(height: 24),
          itemBuilder: (context, index) {
            final reply = widget.replies[index];
            return NoticeReplySection(reply: reply);
          },
        ),
      ],
    );
  }

  Widget _buildEmptyNoticeReply() {
    return Center(
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
    );
  }
}

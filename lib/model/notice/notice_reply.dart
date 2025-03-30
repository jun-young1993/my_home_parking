import 'package:freezed_annotation/freezed_annotation.dart';

part 'notice_reply.freezed.dart';
part 'notice_reply.g.dart';

@freezed
class NoticeReply with _$NoticeReply {
  const factory NoticeReply(
      {required String id,
      required String content,
      required String noticeId,
      required String userName,
      required DateTime createdAt}) = _NoticeReply;

  const NoticeReply._();
  factory NoticeReply.fromJson(Map<String, dynamic> json) =>
      _$NoticeReplyFromJson(json);
}

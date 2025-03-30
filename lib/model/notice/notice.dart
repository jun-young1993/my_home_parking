import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_home_parking/model/notice/notice_reply.dart';

part 'notice.freezed.dart';
part 'notice.g.dart';

@freezed
class Notice with _$Notice {
  const factory Notice({
    required String id,
    required String title,
    required String content,
    required String type,
    required String userName,
    required DateTime createdAt,
    @Default([]) List<NoticeReply>? noticeReplies,
  }) = _Notice;

  const Notice._();
  factory Notice.fromJson(Map<String, dynamic> json) => _$NoticeFromJson(json);
}

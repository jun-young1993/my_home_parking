import 'package:freezed_annotation/freezed_annotation.dart';

part 'notice_event.freezed.dart';

@freezed
class NoticeEvent with _$NoticeEvent {
  const factory NoticeEvent.getNotices() = _GetNotices;
  const factory NoticeEvent.getNotice(String noticeId) = _GetNotice;
  const factory NoticeEvent.createNoticeReply(String noticeId, String content) =
      _CreateNoticeReply;
  const factory NoticeEvent.createNotice(
      String title, String content, String type) = _CreateNotice;
  const factory NoticeEvent.clearError() = _ClearError;
}

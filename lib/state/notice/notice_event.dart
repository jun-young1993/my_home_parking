import 'package:freezed_annotation/freezed_annotation.dart';

part 'notice_event.freezed.dart';

@freezed
class NoticeEvent with _$NoticeEvent {
  const factory NoticeEvent.getNotices() = _GetNotices;
  const factory NoticeEvent.clearError() = _ClearError;
}

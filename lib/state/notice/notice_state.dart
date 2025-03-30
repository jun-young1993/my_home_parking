import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_home_parking/exceptions/app_exception.dart';
import 'package:my_home_parking/model/notice/notice.dart';

part 'notice_state.freezed.dart';

@freezed
class NoticeState with _$NoticeState {
  const factory NoticeState({
    @Default([]) List<Notice> notices,
    @Default(null) Notice? notice,
    @Default(false) bool isLoading,
    @Default(null) AppException? error,
  }) = _NoticeState;

  factory NoticeState.initialize() => const NoticeState();
}

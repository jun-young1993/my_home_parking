import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_home_parking/exceptions/app_exception.dart';
import 'package:my_home_parking/model/log/log.dart';

part 'log_state.freezed.dart';

@freezed
class LogState with _$LogState {
  const factory LogState({
    @Default([]) List<Log> logs,
    @Default(false) bool isLoading,
    @Default(null) AppException? error,
  }) = _LogState;

  factory LogState.initialize() => const LogState();
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_event.freezed.dart';

@freezed
class LogEvent with _$LogEvent {
  const factory LogEvent.getLogs() = _GetLogs;
}

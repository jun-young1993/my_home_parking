import 'package:freezed_annotation/freezed_annotation.dart';

part 'log.freezed.dart';
part 'log.g.dart';

@freezed
class Log with _$Log {
  const factory Log({
    required String id,
    required String description,
    required DateTime createdAt,
    required String logGroupId,
  }) = _Log;

  const Log._();

  factory Log.fromJson(Map<String, dynamic> json) => _$LogFromJson(json);
}

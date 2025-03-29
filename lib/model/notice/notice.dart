import 'package:freezed_annotation/freezed_annotation.dart';

part 'notice.freezed.dart';
part 'notice.g.dart';

@freezed
class Notice with _$Notice {
  const factory Notice({
    required String id,
    required String title,
    required String content,
    required String userName,
    required DateTime createdAt,
  }) = _Notice;

  const Notice._();
  factory Notice.fromJson(Map<String, dynamic> json) => _$NoticeFromJson(json);
}

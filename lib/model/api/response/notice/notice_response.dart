import 'package:freezed_annotation/freezed_annotation.dart';

part 'notice_response.freezed.dart';
part 'notice_response.g.dart';

@freezed
class NoticeResponse with _$NoticeResponse {
  const factory NoticeResponse({
    required String id,
    required String title,
    required String content,
    required String createdAt,
  }) = _NoticeResponse;

  factory NoticeResponse.fromJson(Map<String, dynamic> json) =>
      _$NoticeResponseFromJson(json);
}

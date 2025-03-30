// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_reply.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoticeReplyImpl _$$NoticeReplyImplFromJson(Map<String, dynamic> json) =>
    _$NoticeReplyImpl(
      id: json['id'] as String,
      content: json['content'] as String,
      noticeId: json['noticeId'] as String,
      userName: json['userName'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$NoticeReplyImplToJson(_$NoticeReplyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'noticeId': instance.noticeId,
      'userName': instance.userName,
      'createdAt': instance.createdAt.toIso8601String(),
    };

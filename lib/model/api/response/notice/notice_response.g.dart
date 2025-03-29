// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoticeResponseImpl _$$NoticeResponseImplFromJson(Map<String, dynamic> json) =>
    _$NoticeResponseImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$NoticeResponseImplToJson(
        _$NoticeResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'createdAt': instance.createdAt,
    };

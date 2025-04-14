// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_number.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarNumberImpl _$$CarNumberImplFromJson(Map<String, dynamic> json) =>
    _$CarNumberImpl(
      id: json['id'] as String?,
      region: json['region'] as String,
      category: json['category'] as String,
      number: json['number'] as String,
      isParked: json['isParked'] as bool,
      message: json['message'] as String?,
      fcmToken: json['fcmToken'] as String,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$CarNumberImplToJson(_$CarNumberImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'region': instance.region,
      'category': instance.category,
      'number': instance.number,
      'isParked': instance.isParked,
      'message': instance.message,
      'fcmToken': instance.fcmToken,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

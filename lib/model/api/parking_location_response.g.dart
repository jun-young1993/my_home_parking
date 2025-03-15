// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_location_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ParkingLocationResponseImpl _$$ParkingLocationResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ParkingLocationResponseImpl(
      id: json['id'] as String,
      zoneCode: json['zoneCode'] as String,
      type: json['type'] as String,
      description: json['description'] as String?,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      carNumber: json['carNumber'] == null
          ? null
          : CarNumber.fromJson(json['carNumber'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ParkingLocationResponseImplToJson(
        _$ParkingLocationResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'zoneCode': instance.zoneCode,
      'type': instance.type,
      'description': instance.description,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'carNumber': instance.carNumber,
    };

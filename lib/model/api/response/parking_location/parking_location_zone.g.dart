// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_location_zone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ParkingLocationZoneResponseImpl _$$ParkingLocationZoneResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ParkingLocationZoneResponseImpl(
      id: json['id'] as String,
      zoneCode: json['zoneCode'] as String,
      type: json['type'] as String,
      description: json['description'] as String?,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      carNumbers: (json['carNumbers'] as List<dynamic>?)
              ?.map((e) => CarNumber.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ParkingLocationZoneResponseImplToJson(
        _$ParkingLocationZoneResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'zoneCode': instance.zoneCode,
      'type': instance.type,
      'description': instance.description,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'carNumbers': instance.carNumbers,
    };

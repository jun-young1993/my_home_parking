// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInfoImpl _$$UserInfoImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoImpl(
      carNumber: json['carNumber'] == null
          ? null
          : CarNumber.fromJson(json['carNumber'] as Map<String, dynamic>),
      address: json['address'] as String,
      zoneCode: json['zoneCode'] as String,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$$UserInfoImplToJson(_$UserInfoImpl instance) =>
    <String, dynamic>{
      'carNumber': instance.carNumber,
      'address': instance.address,
      'zoneCode': instance.zoneCode,
      'phoneNumber': instance.phoneNumber,
    };

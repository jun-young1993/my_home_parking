// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInfoImpl _$$UserInfoImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoImpl(
      carNumber: json['carNumber'] as String,
      address: json['address'] as String?,
      zoneCode: json['zoneCode'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      isRegistered: json['isRegistered'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserInfoImplToJson(_$UserInfoImpl instance) =>
    <String, dynamic>{
      'carNumber': instance.carNumber,
      'address': instance.address,
      'zoneCode': instance.zoneCode,
      'phoneNumber': instance.phoneNumber,
      'isRegistered': instance.isRegistered,
    };

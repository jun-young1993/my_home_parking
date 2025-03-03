import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_info.freezed.dart';
part 'address_info.g.dart';

@freezed
class AddressInfo with _$AddressInfo {
  const factory AddressInfo({
    required String address,
    required String zoneCode,
  }) = _AddressInfo;

  factory AddressInfo.fromJson(Map<String, dynamic> json) =>
      _$AddressInfoFromJson(json);
}

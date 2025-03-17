import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_home_parking/model/car_number.dart';

part 'user_info.freezed.dart';
part 'user_info.g.dart';

@freezed
class UserInfo with _$UserInfo {
  const UserInfo._();

  const factory UserInfo({
    CarNumber? carNumber,
    required String address,
    required String zoneCode,
    String? phoneNumber,
  }) = _UserInfo;

  Map<String, dynamic> toRequestJson() => {
        'carNumber': carNumber?.toRequestJson(),
        'address': address,
        'zoneCode': zoneCode,
        'phoneNumber': phoneNumber,
      };

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  bool get isValid => address.isNotEmpty && zoneCode.isNotEmpty;

  bool get isCarNumberValid => carNumber != null && carNumber!.isValid;
}

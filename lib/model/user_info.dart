import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_home_parking/model/car_number.dart';

part 'user_info.freezed.dart';
part 'user_info.g.dart';

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({
    CarNumber? carNumber,
    required String address,
    required String zoneCode,
    String? phoneNumber,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}

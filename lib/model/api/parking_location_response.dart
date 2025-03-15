import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_home_parking/model/car_number.dart';
import 'package:my_home_parking/model/user_info.dart';

part 'parking_location_response.freezed.dart';
part 'parking_location_response.g.dart';

@freezed
class ParkingLocationResponse with _$ParkingLocationResponse {
  const factory ParkingLocationResponse({
    required String id,
    required String zoneCode,
    required String type,
    String? description,
    required String createdAt,
    required String updatedAt,
    CarNumber? carNumber,
  }) = _ParkingLocationResponse;

  factory ParkingLocationResponse.fromJson(Map<String, dynamic> json) =>
      _$ParkingLocationResponseFromJson(json);
}

extension ParkingLocationResponseX on ParkingLocationResponse {
  UserInfo toUserInfo(UserInfo userInfo) => UserInfo(
        address: userInfo.address,
        zoneCode: userInfo.zoneCode,
        carNumber: carNumber,
      );
}

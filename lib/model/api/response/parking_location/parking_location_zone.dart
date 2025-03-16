import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_home_parking/model/car_number.dart';

part 'parking_location_zone.freezed.dart';
part 'parking_location_zone.g.dart';

@freezed
class ParkingLocationZoneResponse with _$ParkingLocationZoneResponse {
  const factory ParkingLocationZoneResponse({
    required String id,
    required String zoneCode,
    required String type,
    String? description,
    required String createdAt,
    required String updatedAt,
    @Default([]) List<CarNumber> carNumbers,
  }) = _ParkingLocationZoneResponse;

  factory ParkingLocationZoneResponse.fromJson(Map<String, dynamic> json) =>
      _$ParkingLocationZoneResponseFromJson(json);
}

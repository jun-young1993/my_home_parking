import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_home_parking/exceptions/app_exception.dart';
import 'package:my_home_parking/model/api/response/parking_location/parking_location_zone.dart';
import 'package:my_home_parking/model/user_info.dart';

part 'main_state.freezed.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    @Default(false) bool isLoading,
    @Default(null) UserInfo? userInfo,
    @Default(null) AppException? error,
    @Default(null) ParkingLocationZoneResponse? parkingLocationZone,
  }) = _MainState;

  factory MainState.initialize() => const MainState();
}

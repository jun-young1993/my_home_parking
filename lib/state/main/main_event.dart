import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_home_parking/model/car_number.dart';
import 'package:my_home_parking/model/user_info.dart';

part 'main_event.freezed.dart';

@freezed
class MainEvent with _$MainEvent {
  const factory MainEvent.checkUserInfo() = _CheckUserInfo;
  const factory MainEvent.checkCarNumber() = _CheckCarNumber;
  const factory MainEvent.saveUserInfo(UserInfo userInfo) = _SaveUserInfo;
  const factory MainEvent.updateLocation(UserInfo userInfo) = _UpdateLocation;
  const factory MainEvent.createCarNumber(CarNumber carNumber) =
      _CreateCarNumber;
  const factory MainEvent.clearError() = _ClearError;
  const factory MainEvent.removeUserInfo() = _RemoveUserInfo;
  const factory MainEvent.getParkingLocationZone() = _GetParkingLocationZone;
  const factory MainEvent.updateParkingCarNumber(CarNumber carNumber) =
      _UpdateParkingCarNumber;
  const factory MainEvent.updateMessageCarNumber(CarNumber carNumber) =
      _UpdateMessageCarNumber;
  const factory MainEvent.sendFcm(
          String senderCarNumberId, String targetCarNumberId, String message) =
      _SendFcm;
}

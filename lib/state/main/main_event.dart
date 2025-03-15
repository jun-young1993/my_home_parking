import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_home_parking/model/car_number.dart';
import 'package:my_home_parking/model/user_info.dart';

part 'main_event.freezed.dart';

@freezed
class MainEvent with _$MainEvent {
  const factory MainEvent.checkUserInfo() = _CheckUserInfo;
  const factory MainEvent.checkCarNumber() = _CheckCarNumber;
  const factory MainEvent.saveUserInfo(UserInfo userInfo) = _SaveUserInfo;
  const factory MainEvent.updateCarNumber(CarNumber carNumber) =
      _UpdateCarNumber;
  const factory MainEvent.clearError() = _ClearError;
  const factory MainEvent.removeUserInfo() = _RemoveUserInfo;
}

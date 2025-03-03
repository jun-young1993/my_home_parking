import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_home_parking/model/user_info.dart';

part 'main_event.freezed.dart';

@freezed
class MainEvent with _$MainEvent {
  const factory MainEvent.checkUserInfo() = _CheckUserInfo;
  const factory MainEvent.registerUserInfo(UserInfo userInfo) =
      _RegisterUserInfo;
  const factory MainEvent.updateUserInfo(UserInfo userInfo) = _UpdateUserInfo;
}

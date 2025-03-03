import 'dart:convert';
import 'package:my_home_parking/exceptions/app_exception.dart';
import 'package:my_home_parking/model/user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class MainRepository {
  Future<UserInfo?> getUserInfo();
  Future<UserInfo> getUserInfoOrFail();
  Future<UserInfo> getUserInfoOrFailWithCarNumber();
  Future<void> saveUserInfo(UserInfo userInfo);
  Future<void> clearUserInfo();
}

class MainDefaultRepository extends MainRepository {
  static const String _userInfoKey = 'user_info';
  final SharedPreferences _prefs;

  MainDefaultRepository(this._prefs);

  @override
  Future<UserInfo?> getUserInfo() async {
    final String? userInfoJson = _prefs.getString(_userInfoKey);
    if (userInfoJson == null) return null;
    return UserInfo.fromJson(jsonDecode(userInfoJson));
  }

  @override
  Future<UserInfo> getUserInfoOrFail() async {
    final userInfo = await getUserInfo();
    if (userInfo == null) {
      throw const AppException.notFoundUserInfo();
    }
    return userInfo;
  }

  @override
  Future<UserInfo> getUserInfoOrFailWithCarNumber() async {
    final userInfo = await getUserInfoOrFail();
    if (userInfo.carNumber == null) {
      throw const AppException.notFoundCarNumber();
    }
    return userInfo;
  }

  @override
  Future<void> saveUserInfo(UserInfo userInfo) async {
    await _prefs.setString(_userInfoKey, jsonEncode(userInfo.toJson()));
  }

  @override
  Future<void> clearUserInfo() async {
    await _prefs.remove(_userInfoKey);
  }
}

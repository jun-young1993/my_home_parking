import 'dart:convert';
import 'package:my_home_parking/model/user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class MainRepository {
  Future<UserInfo?> getUserInfo();
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
  Future<void> saveUserInfo(UserInfo userInfo) async {
    await _prefs.setString(_userInfoKey, jsonEncode(userInfo.toJson()));
  }

  @override
  Future<void> clearUserInfo() async {
    await _prefs.remove(_userInfoKey);
  }
}

import 'dart:convert';
import 'package:my_home_parking/exceptions/app_exception.dart';
import 'package:my_home_parking/model/api/api_response.dart';
import 'package:my_home_parking/model/api/parking_location_response.dart';
import 'package:my_home_parking/model/car_number.dart';
import 'package:my_home_parking/model/user_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_home_parking/core/network/dio_client.dart';
import 'package:my_home_parking/core/constants/api_endpoints.dart';

abstract class MainRepository {
  Future<UserInfo?> getUserInfo();
  Future<UserInfo> getUserInfoOrFail();
  Future<UserInfo> getUserInfoOrFailWithCarNumber();
  Future<void> saveUserInfo(UserInfo userInfo);
  Future<void> clearUserInfo();
  Future<void> updateCarNumber(CarNumber carNumber);
  Future<void> removeUserInfo();
}

class MainDefaultRepository extends MainRepository {
  static const String _userInfoKey = 'user_info';
  final SharedPreferences _prefs;
  final DioClient _dioClient;

  MainDefaultRepository(this._prefs) : _dioClient = DioClient();

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

    if (!userInfo.isValid) {
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

    if (!userInfo.carNumber!.isValid) {
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

  @override
  Future<void> updateCarNumber(CarNumber carNumber) async {
    final userInfo = await getUserInfoOrFail();
    final updatedUserInfo = userInfo.copyWith(carNumber: carNumber);

    try {
      await _dioClient.post(
        ApiEndpoints.parkingLocation,
        data: updatedUserInfo.toJson(),
      );
      await saveUserInfo(updatedUserInfo);
    } catch (e) {
      if (e is AppException) {
        rethrow;
      }
      throw AppException.unknown(e.toString());
    }
  }

  @override
  Future<void> removeUserInfo() async {
    await _prefs.remove(_userInfoKey);
  }
}

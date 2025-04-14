import 'dart:convert';
import 'package:my_home_parking/exceptions/app_exception.dart';
import 'package:my_home_parking/model/api/response/parking_location/parking_location_zone.dart';
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
  Future<ParkingLocationZoneResponse> getParkingLocationZone(String zoneCode);
}

class MainDefaultRepository extends MainRepository {
  static const String _userInfoKey = 'user_info';
  final SharedPreferences _prefs;
  final DioClient _dioClient;

  MainDefaultRepository(this._prefs) : _dioClient = DioClient();

  @override
  Future<UserInfo?> getUserInfo() async {
    final String? userInfoJson = _prefs.getString(_userInfoKey);
    print('[get user info userInfoJson] $userInfoJson');
    if (userInfoJson == null) return null;
    final decodedUserInfo = jsonDecode(userInfoJson);
    final response = await _dioClient.get(
      '${ApiEndpoints.myCar}/${decodedUserInfo['carNumber']['id']}',
    );

    if (response.statusCode == 200) {
      final carNumber = CarNumber.fromJson(response.data);

      return UserInfo.fromJson({
        ...decodedUserInfo,
        'carNumber': carNumber.toJson(),
      });
    }
    return UserInfo.fromJson(decodedUserInfo);
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
    final updatedUserInfo = userInfo.copyWith(
      carNumber: carNumber,
    );

    try {
      final response = await _dioClient.post(
        ApiEndpoints.parkingLocation,
        data: updatedUserInfo.toRequestJson(),
      );

      final updateCarnumber = CarNumber.fromJson(response.data);

      await saveUserInfo(userInfo.copyWith(carNumber: updateCarnumber));
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

  @override
  Future<ParkingLocationZoneResponse> getParkingLocationZone(
      String zoneCode) async {
    final response = await _dioClient.get(
      '${ApiEndpoints.parkingLocationZone}/$zoneCode',
    );
    return ParkingLocationZoneResponse.fromJson(response.data);
  }
}

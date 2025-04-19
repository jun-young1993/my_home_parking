import 'package:my_home_parking/core/constants/api_endpoints.dart';
import 'package:my_home_parking/core/network/dio_client.dart';
import 'package:my_home_parking/exceptions/app_exception.dart';
import 'package:my_home_parking/model/car_number.dart';

abstract class MyCarRepository {
  Future<CarNumber> updateParkingCarNumber(CarNumber carNumber);
  Future<CarNumber> updateMessageCarNumber(CarNumber carNumber);
  Future<void> sendFcm(
      String senderCarNumberId, String targetCarNumberId, String message);
}

class MyCarDefaultRepository extends MyCarRepository {
  final DioClient _dioClient;

  MyCarDefaultRepository() : _dioClient = DioClient();

  @override
  Future<CarNumber> updateParkingCarNumber(CarNumber carNumber) async {
    if (carNumber.id == null) {
      throw const AppException.invalidCarNumber();
    }
    final response = await _dioClient.put(
      '${ApiEndpoints.myCar}/parking/${carNumber.id}',
      data: carNumber.toRequestJson(),
    );

    return CarNumber.fromJson(response.data);
  }

  @override
  Future<CarNumber> updateMessageCarNumber(CarNumber carNumber) async {
    if (carNumber.id == null) {
      throw const AppException.invalidCarNumber();
    }
    final response = await _dioClient.put(
      '${ApiEndpoints.myCar}/message/${carNumber.id}',
      data: carNumber.toRequestJson(),
    );

    return CarNumber.fromJson(response.data);
  }

  @override
  Future<void> sendFcm(String senderCarNumberId, String targetCarNumberId,
      String message) async {
    await _dioClient.post(
      '${ApiEndpoints.myCar}/send-fcm',
      data: {
        'senderCarNumberId': senderCarNumberId,
        'targetCarNumberId': targetCarNumberId,
        'message': message,
      },
    );
  }
}

import 'package:my_home_parking/core/constants/api_endpoints.dart';
import 'package:my_home_parking/core/network/dio_client.dart';
import 'package:my_home_parking/exceptions/app_exception.dart';
import 'package:my_home_parking/model/car_number.dart';

abstract class MyCarRepository {
  Future<CarNumber> updateCarNumber(CarNumber carNumber);
}

class MyCarDefaultRepository extends MyCarRepository {
  final DioClient _dioClient;

  MyCarDefaultRepository() : _dioClient = DioClient();

  @override
  Future<CarNumber> updateCarNumber(CarNumber carNumber) async {
    if (carNumber.id == null) {
      throw const AppException.invalidCarNumber();
    }
    final response = await _dioClient.put(
      '${ApiEndpoints.myCar}/${carNumber.id}',
      data: carNumber.toRequestJson(),
    );

    return CarNumber.fromJson(response.data);
  }
}

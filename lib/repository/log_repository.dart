import 'package:my_home_parking/core/constants/api_endpoints.dart';
import 'package:my_home_parking/core/network/dio_client.dart';
import 'package:my_home_parking/exceptions/app_exception.dart';
import 'package:my_home_parking/model/log/log.dart';

abstract class LogRepository {
  Future<List<Log>> getLogs(String zoneCode);
}

class LogDefaultRepository extends LogRepository {
  final DioClient _dioClient;

  LogDefaultRepository() : _dioClient = DioClient();

  @override
  Future<List<Log>> getLogs(String zoneCode) async {
    final response = await _dioClient.get(
      '${ApiEndpoints.parkingLocationLog}/$zoneCode',
      queryParameters: {'take': 20},
    );

    if (response.statusCode != 200) {
      throw const AppException.unknown('getLogs failed');
    }

    final List<dynamic> dataList = response.data as List;

    return dataList
        .map((json) => Log.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}

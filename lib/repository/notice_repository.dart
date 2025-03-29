import 'package:my_home_parking/core/constants/api_endpoints.dart';
import 'package:my_home_parking/core/network/dio_client.dart';
import 'package:my_home_parking/model/notice/notice.dart';

abstract class NoticeRepository {
  Future<List<Notice>> getNotices(String zoneCode);
}

class NoticeDefaultRepository extends NoticeRepository {
  final DioClient _dioClient;

  NoticeDefaultRepository() : _dioClient = DioClient();

  @override
  Future<List<Notice>> getNotices(String zoneCode) async {
    final response =
        await _dioClient.get('${ApiEndpoints.parkingLocationNotice}/$zoneCode');
    final List<dynamic> jsonList = response.data;
    return jsonList
        .map((json) => Notice.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}

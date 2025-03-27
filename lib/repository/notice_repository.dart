import 'package:my_home_parking/core/constants/api_endpoints.dart';
import 'package:my_home_parking/core/network/dio_client.dart';
import 'package:my_home_parking/model/notice/notice.dart';

abstract class NoticeRepository {
  Future<List<Notice>> getNotices();
}

class NoticeDefaultRepository extends NoticeRepository {
  final DioClient _dioClient;

  NoticeDefaultRepository() : _dioClient = DioClient();

  @override
  Future<List<Notice>> getNotices() async {
    final response = await _dioClient.get(ApiEndpoints.notice);
    return response.data.map((e) => Notice.fromJson(e)).toList();
  }
}

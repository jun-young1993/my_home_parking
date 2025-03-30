import 'package:my_home_parking/core/constants/api_endpoints.dart';
import 'package:my_home_parking/core/network/dio_client.dart';
import 'package:my_home_parking/exceptions/app_exception.dart';
import 'package:my_home_parking/model/notice/notice.dart';
import 'package:my_home_parking/model/notice/notice_reply.dart';

abstract class NoticeRepository {
  Future<List<Notice>> getNotices(String zoneCode);
  Future<Notice> getNotice(String noticeId);
  Future<NoticeReply> createNoticeReply(
      String noticeId, String content, String userName);
  Future<Notice> createNotice(String zoneCode, String userName, String content,
      String title, String type);
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

  @override
  Future<Notice> getNotice(String noticeId) async {
    final response = await _dioClient.get('${ApiEndpoints.notice}/$noticeId');
    if (response.statusCode == 404) {
      throw const AppException.notFoundNotice();
    }
    if (response.statusCode != 200) {
      throw const AppException.unknown('getNotice failed');
    }
    return Notice.fromJson(response.data);
  }

  @override
  Future<Notice> createNotice(String zoneCode, String userName, String content,
      String title, String type) async {
    final response = await _dioClient.post(
      '${ApiEndpoints.parkingLocation}/notice/$zoneCode',
      data: {
        'userName': userName,
        'content': content,
        'title': title,
        'type': type,
      },
    );
    if (response.statusCode != 201) {
      throw const AppException.unknown('createNotice failed');
    }
    return Notice.fromJson(response.data);
  }

  @override
  Future<NoticeReply> createNoticeReply(
      String noticeId, String content, String userName) async {
    final response = await _dioClient.post(ApiEndpoints.noticeReply,
        data: {'content': content, 'noticeId': noticeId, 'userName': userName});
    if (response.statusCode != 201) {
      throw const AppException.unknown('createNoticeReply failed');
    }
    return NoticeReply.fromJson(response.data);
  }
}

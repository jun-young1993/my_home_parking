import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_exception.freezed.dart';

@freezed
class AppException with _$AppException implements Exception {
  // 사용자 정보 관련 예외
  const factory AppException.notFoundUserInfo() = NotFoundUserInfoException;
  const factory AppException.invalidUserInfo() = InvalidUserInfoException;
  const factory AppException.userInfoSave() = UserInfoSaveException;
  const factory AppException.notFoundCarNumber() = NotFoundCarNumberException;

  // 플랫폼 관련 예외
  const factory AppException.webView() = WebViewException;
  const factory AppException.unknown(String message) = UnknownException;

  const factory AppException.timeout() = _Timeout;
  const factory AppException.network(String message) = _Network;
  const factory AppException.badRequest(String message) = _BadRequest;
  const factory AppException.unauthorized() = _Unauthorized;
  const factory AppException.forbidden() = _Forbidden;
  const factory AppException.notFound() = _NotFound;
  const factory AppException.server(String message) = _Server;
  const factory AppException.cancelled() = _Cancelled;
}

extension AppExceptionMessage on AppException {
  String get message => when(
        notFoundUserInfo: () => '사용자 정보를 찾을 수 없습니다.',
        notFoundCarNumber: () => '차량번호를 찾을 수 없습니다.',
        invalidUserInfo: () => '잘못된 사용자 정보입니다.',
        userInfoSave: () => '사용자 정보 저장에 실패했습니다.',
        webView: () => '주소 검색 기능을 불러오는데 실패했습니다.',
        unknown: (message) => message,
        timeout: () => '요청 시간이 초과되었습니다.',
        network: (message) => message,
        badRequest: (message) => message,
        unauthorized: () => '인증이 필요합니다.',
        forbidden: () => '접근이 금지되었습니다.',
        notFound: () => '요청한 리소스를 찾을 수 없습니다.',
        server: (message) => message,
        cancelled: () => '요청이 취소되었습니다.',
      );
}

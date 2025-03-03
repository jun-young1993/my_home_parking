import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_exception.freezed.dart';

@freezed
class AppException with _$AppException implements Exception {
  // 사용자 정보 관련 예외
  const factory AppException.notFoundUserInfo() = NotFoundUserInfoException;
  const factory AppException.invalidUserInfo() = InvalidUserInfoException;
  const factory AppException.userInfoSave() = UserInfoSaveException;
  const factory AppException.userInfoUpdate() = UserInfoUpdateException;

  // 플랫폼 관련 예외
  const factory AppException.webView() = WebViewException;
  const factory AppException.unknown(String message) = UnknownException;
}

extension AppExceptionMessage on AppException {
  String get message => when(
        notFoundUserInfo: () => '사용자 정보를 찾을 수 없습니다.',
        invalidUserInfo: () => '잘못된 사용자 정보입니다.',
        userInfoSave: () => '사용자 정보 저장에 실패했습니다.',
        userInfoUpdate: () => '사용자 정보 업데이트에 실패했습니다.',
        webView: () => '주소 검색 기능을 불러오는데 실패했습니다.',
        unknown: (message) => message,
      );
}

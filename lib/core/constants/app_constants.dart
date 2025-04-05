class AppConstants {
  static const int localPort = 8080;

  // localhost URL 생성 헬퍼 메서드
  // static String get localHostUrl => 'http://localhost:$localPort';
  static String get localHostUrl => 'http://localhost:9999';

  static String get appName => '우리집 주차장';
  static String get parkingMapMenuDisplayName => '주차장';
  static String get parkingNoticeMenuDisplayName => '주차장 게시판';

  // 주차장 알림 화면 메뉴
  static String get parkingLogMenuDisplayName => '최근 알림';
  static String get parkingEmptySpaceMenuDisplayName => '아직 알림이 없습니다.';
  // 주변 정보 화면 메뉴
  // 홈 화면 메뉴
  static String get parkingMainMenuHome => '홈';
  static String get parkingMainMenuParkingMap => '주차장 찾기';
  static String get parkingMainMenuParkingStatus => '주차 현황';
  static String get parkingMainMenuSetting => '설정';

  // 주차장 찾기 화면 메뉴
}

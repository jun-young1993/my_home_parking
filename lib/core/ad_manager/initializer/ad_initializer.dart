import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:my_home_parking/core/ad_manager/ad_manager.dart';
import 'package:my_home_parking/core/ad_manager/types/ad_types.dart';

class AdInitializer {
  static Future<void> initialize() async {
    // MobileAds 초기화
    await MobileAds.instance.initialize();

    // 테스트 기기 설정
    final List<String> testDeviceIds = ['YOUR_TEST_DEVICE_ID'];
    RequestConfiguration configuration = RequestConfiguration(
      testDeviceIds: testDeviceIds,
    );
    MobileAds.instance.updateRequestConfiguration(configuration);

    // 광고 매니저 초기화
    final adManager = AdManager();

    // 배너 광고 미리 로드
    await adManager.loadBannerAd(
      size: AdSize.banner,
      isTest: kDebugMode,
    );

    // 전면 광고 미리 로드
    await adManager.loadInterstitialAd(
      isTest: kDebugMode,
    );

    // 보상형 광고 미리 로드
    await adManager.loadRewardedAd(
      isTest: kDebugMode,
    );

    debugPrint('Ad initialization completed');
  }
}

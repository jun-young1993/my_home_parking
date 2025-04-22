import 'package:google_mobile_ads/google_mobile_ads.dart' as ads;

/// 광고 타입을 정의하는 enum
enum AdType {
  banner,
  interstitial,
  rewarded,
  native,
  appOpen,
}

/// 광고 크기를 정의하는 enum
enum AdSize {
  banner,
  largeBanner,
  mediumRectangle,
  fullBanner,
  leaderboard,
  adaptive,
}

/// 광고 크기 매핑
extension AdSizeExtension on AdSize {
  ads.AdSize getAdSize() {
    switch (this) {
      case AdSize.banner:
        return ads.AdSize.banner;
      case AdSize.largeBanner:
        return ads.AdSize.largeBanner;
      case AdSize.mediumRectangle:
        return ads.AdSize.mediumRectangle;
      case AdSize.fullBanner:
        return ads.AdSize.fullBanner;
      case AdSize.leaderboard:
        return ads.AdSize.leaderboard;
      case AdSize.adaptive:
        return ads.AdSize.adaptive;
    }
  }
}

/// 광고 리스너 인터페이스
abstract class AdListener {
  void onAdLoaded(ads.Ad ad);
  void onAdFailedToLoad(ads.Ad ad, ads.LoadAdError error);
  void onAdClosed(ads.Ad ad);
  void onAdFailedToShow(ads.Ad ad, ads.AdError error);
}

/// 광고 ID를 관리하는 클래스
class AdUnitIds {
  static const String testBannerAdUnitId =
      'ca-app-pub-3940256099942544/6300978111';
  static const String testInterstitialAdUnitId =
      'ca-app-pub-3940256099942544/1033173712';
  static const String testRewardedAdUnitId =
      'ca-app-pub-3940256099942544/5224354917';
  static const String testNativeAdUnitId =
      'ca-app-pub-3940256099942544/2247696110';
  static const String testAppOpenAdUnitId =
      'ca-app-pub-3940256099942544/3419835294';

  // 실제 광고 ID는 여기에 추가
  static const String bannerAdUnitId = '';
  static const String interstitialAdUnitId = '';
  static const String rewardedAdUnitId = '';
  static const String nativeAdUnitId = '';
  static const String appOpenAdUnitId = '';

  /// 테스트 모드 여부에 따라 적절한 광고 ID를 반환
  static String getAdUnitId(AdType type, {bool isTest = true}) {
    if (isTest) {
      switch (type) {
        case AdType.banner:
          return testBannerAdUnitId;
        case AdType.interstitial:
          return testInterstitialAdUnitId;
        case AdType.rewarded:
          return testRewardedAdUnitId;
        case AdType.native:
          return testNativeAdUnitId;
        case AdType.appOpen:
          return testAppOpenAdUnitId;
      }
    } else {
      switch (type) {
        case AdType.banner:
          return bannerAdUnitId;
        case AdType.interstitial:
          return interstitialAdUnitId;
        case AdType.rewarded:
          return rewardedAdUnitId;
        case AdType.native:
          return nativeAdUnitId;
        case AdType.appOpen:
          return appOpenAdUnitId;
      }
    }
  }
}

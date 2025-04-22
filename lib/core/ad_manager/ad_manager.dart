import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart' as ads;
import 'package:my_home_parking/core/ad_manager/types/ad_types.dart';

/// 광고 매니저 싱글톤 클래스
class AdManager {
  static final AdManager _instance = AdManager._internal();
  factory AdManager() => _instance;
  AdManager._internal();

  /// 현재 로드된 광고들을 저장하는 맵
  final Map<AdType, ads.Ad> _loadedAds = {};

  /// 광고 로딩 상태를 추적하는 맵
  final Map<AdType, bool> _isLoading = {};

  /// 광고 로드 중인지 확인
  bool isLoading(AdType type) => _isLoading[type] ?? false;

  /// 광고가 로드되었는지 확인
  bool isAdLoaded(AdType type) => _loadedAds[type] != null;

  /// 배너 광고 로드
  Future<ads.BannerAd?> loadBannerAd({
    required AdSize size,
    bool isTest = true,
    AdLoadedCallback? onAdLoaded,
    AdFailedToLoadCallback? onAdFailedToLoad,
  }) async {
    if (isLoading(AdType.banner)) return null;
    _isLoading[AdType.banner] = true;

    try {
      final bannerAd = ads.BannerAd(
        adUnitId: AdUnitIds.getAdUnitId(AdType.banner, isTest: isTest),
        size: size.getAdSize(),
        request: const ads.AdRequest(),
        listener: ads.BannerAdListener(
          onAdLoaded: (ad) {
            debugPrint('Banner Ad loaded');
            onAdLoaded?.call(ad);
            _loadedAds[AdType.banner] = ad;
            _isLoading[AdType.banner] = false;
          },
          onAdFailedToLoad: (ad, error) {
            debugPrint('Banner Ad failed to load: $error');
            onAdFailedToLoad?.call(ad, error);
            ad.dispose();
            _isLoading[AdType.banner] = false;
          },
          onAdOpened: (ad) => debugPrint('Banner Ad opened'),
          onAdClosed: (ad) => debugPrint('Banner Ad closed'),
          onAdImpression: (ad) => debugPrint('Banner Ad impression'),
        ),
      );

      await bannerAd.load();
      return bannerAd;
    } catch (e) {
      debugPrint('Error loading banner ad: $e');
      _isLoading[AdType.banner] = false;
      return null;
    }
  }

  /// 전면 광고 로드
  Future<ads.InterstitialAd?> loadInterstitialAd({
    bool isTest = true,
    AdLoadedCallback? onAdLoaded,
    AdFailedToLoadCallback? onAdFailedToLoad,
    AdClosedCallback? onAdClosed,
    AdFailedToShowCallback? onAdFailedToShow,
  }) async {
    if (isLoading(AdType.interstitial)) return null;
    _isLoading[AdType.interstitial] = true;

    try {
      ads.InterstitialAd? interstitialAd;
      await ads.InterstitialAd.load(
        adUnitId: AdUnitIds.getAdUnitId(AdType.interstitial, isTest: isTest),
        request: const ads.AdRequest(),
        adLoadCallback: ads.InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            debugPrint('Interstitial Ad loaded');
            interstitialAd = ad;
            onAdLoaded?.call(ad);
            _loadedAds[AdType.interstitial] = ad;
            _isLoading[AdType.interstitial] = false;

            ad.fullScreenContentCallback = ads.FullScreenContentCallback(
              onAdDismissedFullScreenContent: (ad) {
                debugPrint('Interstitial Ad dismissed');
                onAdClosed?.call(ad);
                ad.dispose();
                _loadedAds.remove(AdType.interstitial);
              },
              onAdFailedToShowFullScreenContent: (ad, error) {
                debugPrint('Interstitial Ad failed to show: $error');
                onAdFailedToShow?.call(ad, error);
                ad.dispose();
                _loadedAds.remove(AdType.interstitial);
              },
              onAdShowedFullScreenContent: (ad) =>
                  debugPrint('Interstitial Ad showed'),
              onAdImpression: (ad) => debugPrint('Interstitial Ad impression'),
            );
          },
          onAdFailedToLoad: (error) {
            debugPrint('Interstitial Ad failed to load: $error');
            onAdFailedToLoad?.call(interstitialAd!, error);
            _isLoading[AdType.interstitial] = false;
          },
        ),
      );
      return interstitialAd;
    } catch (e) {
      debugPrint('Error loading interstitial ad: $e');
      _isLoading[AdType.interstitial] = false;
      return null;
    }
  }

  /// 보상형 광고 로드
  Future<ads.RewardedAd?> loadRewardedAd({
    bool isTest = true,
    AdLoadedCallback? onAdLoaded,
    AdFailedToLoadCallback? onAdFailedToLoad,
    AdClosedCallback? onAdClosed,
    AdFailedToShowCallback? onAdFailedToShow,
    UserEarnedRewardCallback? onUserEarnedReward,
  }) async {
    if (isLoading(AdType.rewarded)) return null;
    _isLoading[AdType.rewarded] = true;

    try {
      ads.RewardedAd? rewardedAd;
      await ads.RewardedAd.load(
        adUnitId: AdUnitIds.getAdUnitId(AdType.rewarded, isTest: isTest),
        request: const ads.AdRequest(),
        rewardedAdLoadCallback: ads.RewardedAdLoadCallback(
          onAdLoaded: (ad) {
            debugPrint('Rewarded Ad loaded');
            rewardedAd = ad;
            onAdLoaded?.call(ad);
            _loadedAds[AdType.rewarded] = ad;
            _isLoading[AdType.rewarded] = false;

            ad.fullScreenContentCallback = ads.FullScreenContentCallback(
              onAdDismissedFullScreenContent: (ad) {
                debugPrint('Rewarded Ad dismissed');
                onAdClosed?.call(ad);
                ad.dispose();
                _loadedAds.remove(AdType.rewarded);
              },
              onAdFailedToShowFullScreenContent: (ad, error) {
                debugPrint('Rewarded Ad failed to show: $error');
                onAdFailedToShow?.call(ad, error);
                ad.dispose();
                _loadedAds.remove(AdType.rewarded);
              },
              onAdShowedFullScreenContent: (ad) =>
                  debugPrint('Rewarded Ad showed'),
              onAdImpression: (ad) => debugPrint('Rewarded Ad impression'),
            );
          },
          onAdFailedToLoad: (error) {
            debugPrint('Rewarded Ad failed to load: $error');
            onAdFailedToLoad?.call(rewardedAd!, error);
            _isLoading[AdType.rewarded] = false;
          },
        ),
      );
      return rewardedAd;
    } catch (e) {
      debugPrint('Error loading rewarded ad: $e');
      _isLoading[AdType.rewarded] = false;
      return null;
    }
  }

  /// 광고 표시
  void showAd(AdType type) {
    final ad = _loadedAds[type];
    if (ad == null) {
      debugPrint('No ad loaded for type: $type');
      return;
    }

    switch (type) {
      case AdType.interstitial:
        if (ad is ads.InterstitialAd) {
          ad.show();
        }
        break;
      case AdType.rewarded:
        if (ad is ads.RewardedAd) {
          ad.show(
            onUserEarnedReward: (_, reward) {
              debugPrint('User earned reward: ${reward.amount} ${reward.type}');
            },
          );
        }
        break;
      default:
        debugPrint('Cannot show ad of type: $type');
        break;
    }
  }

  /// 특정 타입의 광고 해제
  void disposeAd(AdType type) {
    final ad = _loadedAds[type];
    if (ad != null) {
      ad.dispose();
      _loadedAds.remove(type);
      _isLoading.remove(type);
    }
  }

  /// 모든 광고 해제
  void dispose() {
    for (var ad in _loadedAds.values) {
      ad.dispose();
    }
    _loadedAds.clear();
    _isLoading.clear();
  }
}

import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart' as ads;
import 'package:my_home_parking/core/ad_manager/types/ad_types.dart';

/// 광고 매니저 싱글톤 클래스
class AdManager {
  static final AdManager _instance = AdManager._internal();
  factory AdManager() => _instance;
  AdManager._internal();

  /// 현재 로드된 광고들을 저장하는 맵
  final Map<AdType, dynamic> _loadedAds = {};

  /// 광고 로딩 상태를 추적하는 맵
  final Map<AdType, bool> _isLoading = {};

  /// 배너 광고 로드
  Future<ads.BannerAd?> loadBannerAd({
    required AdSize size,
    bool isTest = true,
    AdListener? listener,
  }) async {
    if (_isLoading[AdType.banner] == true) return null;
    _isLoading[AdType.banner] = true;

    try {
      final bannerAd = ads.BannerAd(
        adUnitId: AdUnitIds.getAdUnitId(AdType.banner, isTest: isTest),
        size: size.getAdSize(),
        request: const ads.AdRequest(),
        listener: ads.AdListener(
          onAdLoaded: (ad) {
            debugPrint('Banner Ad loaded');
            listener?.onAdLoaded(ad);
            _loadedAds[AdType.banner] = ad;
            _isLoading[AdType.banner] = false;
          },
          onAdFailedToLoad: (ad, error) {
            debugPrint('Banner Ad failed to load: $error');
            listener?.onAdFailedToLoad(ad, error);
            ad.dispose();
            _isLoading[AdType.banner] = false;
          },
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
    AdListener? listener,
  }) async {
    if (_isLoading[AdType.interstitial] == true) return null;
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
            listener?.onAdLoaded(ad);
            _loadedAds[AdType.interstitial] = ad;
            _isLoading[AdType.interstitial] = false;

            ad.fullScreenContentCallback = ads.FullScreenContentCallback(
              onAdDismissedFullScreenContent: (ad) {
                listener?.onAdClosed(ad);
                ad.dispose();
              },
              onAdFailedToShowFullScreenContent: (ad, error) {
                listener?.onAdFailedToShow(ad, error);
                ad.dispose();
              },
            );
          },
          onAdFailedToLoad: (error) {
            debugPrint('Interstitial Ad failed to load: $error');
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
    AdListener? listener,
  }) async {
    if (_isLoading[AdType.rewarded] == true) return null;
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
            listener?.onAdLoaded(ad);
            _loadedAds[AdType.rewarded] = ad;
            _isLoading[AdType.rewarded] = false;

            ad.fullScreenContentCallback = ads.FullScreenContentCallback(
              onAdDismissedFullScreenContent: (ad) {
                listener?.onAdClosed(ad);
                ad.dispose();
              },
              onAdFailedToShowFullScreenContent: (ad, error) {
                listener?.onAdFailedToShow(ad, error);
                ad.dispose();
              },
            );
          },
          onAdFailedToLoad: (error) {
            debugPrint('Rewarded Ad failed to load: $error');
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
    if (ad == null) return;

    switch (type) {
      case AdType.interstitial:
        (ad as ads.InterstitialAd).show();
        break;
      case AdType.rewarded:
        (ad as ads.RewardedAd).show(
          onUserEarnedReward: (_, reward) {
            debugPrint('User earned reward: ${reward.amount} ${reward.type}');
          },
        );
        break;
      default:
        break;
    }
  }

  /// 모든 광고 해제
  void dispose() {
    for (var ad in _loadedAds.values) {
      if (ad is ads.BannerAd) {
        ad.dispose();
      } else if (ad is ads.InterstitialAd || ad is ads.RewardedAd) {
        ad.dispose();
      }
    }
    _loadedAds.clear();
    _isLoading.clear();
  }
}

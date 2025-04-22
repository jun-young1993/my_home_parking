import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart' as ads;
import 'package:my_home_parking/core/ad_manager/ad_manager.dart';
import 'package:my_home_parking/core/ad_manager/types/ad_types.dart';

/// 광고 상태를 관리하는 Provider
class AdProvider extends ChangeNotifier implements AdListener {
  final AdManager _adManager = AdManager();
  final Map<AdType, bool> _isLoading = {};
  final Map<AdType, bool> _isLoaded = {};
  final Map<AdType, bool> _isShowing = {};

  bool isLoading(AdType type) => _isLoading[type] ?? false;
  bool isLoaded(AdType type) => _isLoaded[type] ?? false;
  bool isShowing(AdType type) => _isShowing[type] ?? false;

  /// 배너 광고 로드
  Future<void> loadBannerAd({
    required AdSize size,
    bool isTest = true,
  }) async {
    if (isLoading(AdType.banner)) return;
    _isLoading[AdType.banner] = true;
    notifyListeners();

    await _adManager.loadBannerAd(
      size: size,
      isTest: isTest,
      listener: this,
    );
  }

  /// 전면 광고 로드
  Future<void> loadInterstitialAd({
    bool isTest = true,
  }) async {
    if (isLoading(AdType.interstitial)) return;
    _isLoading[AdType.interstitial] = true;
    notifyListeners();

    await _adManager.loadInterstitialAd(
      isTest: isTest,
      listener: this,
    );
  }

  /// 보상형 광고 로드
  Future<void> loadRewardedAd({
    bool isTest = true,
  }) async {
    if (isLoading(AdType.rewarded)) return;
    _isLoading[AdType.rewarded] = true;
    notifyListeners();

    await _adManager.loadRewardedAd(
      isTest: isTest,
      listener: this,
    );
  }

  /// 광고 표시
  void showAd(AdType type) {
    if (!isLoaded(type)) return;
    _isShowing[type] = true;
    notifyListeners();
    _adManager.showAd(type);
  }

  @override
  void onAdLoaded(ads.Ad ad) {
    final type = _getAdType(ad);
    if (type != null) {
      _isLoading[type] = false;
      _isLoaded[type] = true;
      notifyListeners();
    }
  }

  @override
  void onAdFailedToLoad(ads.Ad ad, ads.LoadAdError error) {
    final type = _getAdType(ad);
    if (type != null) {
      _isLoading[type] = false;
      _isLoaded[type] = false;
      notifyListeners();
    }
  }

  @override
  void onAdClosed(ads.Ad ad) {
    final type = _getAdType(ad);
    if (type != null) {
      _isShowing[type] = false;
      _isLoaded[type] = false;
      notifyListeners();
    }
  }

  @override
  void onAdFailedToShow(ads.Ad ad, ads.AdError error) {
    final type = _getAdType(ad);
    if (type != null) {
      _isShowing[type] = false;
      _isLoaded[type] = false;
      notifyListeners();
    }
  }

  AdType? _getAdType(ads.Ad ad) {
    if (ad is ads.BannerAd) return AdType.banner;
    if (ad is ads.InterstitialAd) return AdType.interstitial;
    if (ad is ads.RewardedAd) return AdType.rewarded;
    return null;
  }

  @override
  void dispose() {
    _adManager.dispose();
    super.dispose();
  }
}

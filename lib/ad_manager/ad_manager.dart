import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdManager {
  static final AdManager _instance = AdManager._internal();
  factory AdManager() => _instance;
  AdManager._internal();

  bool _isInitialized = false;
  final bool _isTestMode = kDebugMode; // 테스트 모드 기본값

  // 플랫폼별 테스트 광고 ID
  static const Map<String, Map<String, String>> _testAdUnitIds = {
    'android': {
      'banner': 'ca-app-pub-3940256099942544/6300978111', // 고정 크기 배너
      // 전면 광고
      // 보상형 광고
    },
    'ios': {
      'banner': 'ca-app-pub-3940256099942544/2934735716',
    },
  };

  // 실제 광고 ID
  static const Map<String, Map<String, String>> _realAdUnitIds = {
    'android': {
      'banner': 'ca-app-pub-4656262305566191/9119242850',
    },
    'ios': {
      'banner': 'ca-app-pub-4656262305566191/3532600608',
    },
  };

  // 현재 플랫폼의 광고 ID 가져오기
  String _getAdUnitId(String adType) {
    final platform = Platform.isAndroid ? 'android' : 'ios';
    final adUnitIds = _isTestMode ? _testAdUnitIds : _realAdUnitIds;
    final adUnitId = adUnitIds[platform]?[adType];
    if (adUnitId == null) {
      throw Exception('광고 ID가 존재하지 않습니다.');
    }
    print('AdManager: _getAdUnitId: $adUnitId');
    return adUnitId;
  }

  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      await MobileAds.instance.initialize();
      // await MobileAds.instance.updateRequestConfiguration(
      //   RequestConfiguration(
      //     testDeviceIds: ['TEST_DEVICE_ID'], // 테스트 기기 ID 추가
      //   ),
      // );
      _isInitialized = true;
      print('AdManager: 초기화 성공');
    } catch (e) {
      print('AdManager: 초기화 실패: $e');
      rethrow;
    }
  }

  // 배너 광고 생성
  BannerAd createBannerAd() {
    print('AdManager: createBannerAd ${_getAdUnitId('banner')}');
    return BannerAd(
      adUnitId: _getAdUnitId('banner'),
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          debugPrint('배너 광고가 로드되었습니다.');
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint('배너 광고 로드 실패: ${error.message}');
          ad.dispose();
        },
      ),
    );
  }

  // 전면 광고 생성
  Future<InterstitialAd?> createInterstitialAd() async {
    InterstitialAd? interstitialAd;
    await InterstitialAd.load(
      adUnitId: _getAdUnitId('interstitial'),
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          interstitialAd = ad;
          debugPrint('전면 광고가 로드되었습니다.');
        },
        onAdFailedToLoad: (error) {
          debugPrint('전면 광고 로드 실패: ${error.message}');
        },
      ),
    );
    return interstitialAd;
  }

  // 보상형 광고 생성
  Future<RewardedAd?> createRewardedAd() async {
    RewardedAd? rewardedAd;
    await RewardedAd.load(
      adUnitId: _getAdUnitId('rewarded'),
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          rewardedAd = ad;
          debugPrint('보상형 광고가 로드되었습니다.');
        },
        onAdFailedToLoad: (error) {
          debugPrint('보상형 광고 로드 실패: ${error.message}');
        },
      ),
    );
    return rewardedAd;
  }
}

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:my_home_parking/ad_manager/ad_manager.dart';

class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({Key? key}) : super(key: key);

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  BannerAd? _bannerAd;
  bool _isAdLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadBannerAd();
  }

  void _loadBannerAd() {
    print('BannerAdWidget: _loadBannerAd');
    _bannerAd = AdManager().createBannerAd()
      ..load().then((value) {
        setState(() {
          print('BannerAdWidget: _isAdLoaded: $_isAdLoaded');
          _isAdLoaded = true;
        });
      }).catchError((error) {
        print('BannerAdWidget: _loadBannerAd: $error');
      });
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('BannerAdWidget: _isAdLoaded: loading $_isAdLoaded');
    if (!_isAdLoaded) {
      return const SizedBox(
        height: 50,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return SizedBox(
      width: _bannerAd!.size.width.toDouble(),
      height: _bannerAd!.size.height.toDouble(),
      child: AdWidget(ad: _bannerAd!),
    );
  }
}

class InterstitialAdWidget {
  static Future<void> show() async {
    final interstitialAd = await AdManager().createInterstitialAd();
    if (interstitialAd != null) {
      await interstitialAd.show();
    }
  }
}

class RewardedAdWidget {
  static Future<void> show({
    required Function(RewardItem) onRewarded,
    required Function() onFailedToShow,
  }) async {
    final rewardedAd = await AdManager().createRewardedAd();
    if (rewardedAd != null) {
      await rewardedAd.show(
        onUserEarnedReward: (_, reward) {
          onRewarded(reward);
        },
      );
    } else {
      onFailedToShow();
    }
  }
}

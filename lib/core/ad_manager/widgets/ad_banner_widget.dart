import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:my_home_parking/core/ad_manager/ad_manager.dart';
import 'package:my_home_parking/core/ad_manager/types/ad_types.dart';

class AdBannerWidget extends StatefulWidget {
  final AdSize size;
  final bool isTest;
  final EdgeInsets? margin;
  final Alignment alignment;

  const AdBannerWidget({
    super.key,
    this.size = AdSize.banner,
    this.isTest = true,
    this.margin,
    this.alignment = Alignment.center,
  });

  @override
  State<AdBannerWidget> createState() => _AdBannerWidgetState();
}

class _AdBannerWidgetState extends State<AdBannerWidget> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadBannerAd();
  }

  Future<void> _loadBannerAd() async {
    final bannerAd = await AdManager().loadBannerAd(
      size: widget.size,
      isTest: widget.isTest,
      listener: AdListener(
        onAdLoaded: (ad) {
          setState(() {
            _isLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    );

    if (bannerAd != null) {
      setState(() {
        _bannerAd = bannerAd;
      });
    }
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoaded || _bannerAd == null) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: widget.margin,
      alignment: widget.alignment,
      child: AdWidget(ad: _bannerAd!),
    );
  }
}

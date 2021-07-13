import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:native_ad_flutter/ad_helper.dart';

class NativeAdsPage extends StatefulWidget {
  const NativeAdsPage({Key? key}) : super(key: key);

  @override
  _NativeAdsPageState createState() => _NativeAdsPageState();
}

class _NativeAdsPageState extends State<NativeAdsPage> {
  late NativeAd _ad;
  bool _isAdLoaded = false;

  @override
  void initState() {
    super.initState();
    _ad = NativeAd(
        adUnitId: AdHelper.nativeAdUnitId,
        factoryId: "listTile",
        listener: NativeAdListener(
          onAdLoaded: (_) {
            setState(() {
              _isAdLoaded = true;
            });
          },
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
            print(
                'Ad load failed (code=${error.code} message=${error.message}');
          },
        ),
        request: AdRequest());
    _ad.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      body: _isAdLoaded
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: AdWidget(ad: _ad),
                  height: 72.0,
                  //alignment: Alignment.center,
                ),
              ],
            )
          : Center(
              child: Container(
                child: Text('not found'),
              ),
            ),
    );
  }

  @override
  void dispose() {
    _ad.dispose();

    super.dispose();
  }
}

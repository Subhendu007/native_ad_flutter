import 'package:flutter/material.dart';
import 'package:native_ad_flutter/ad_helper.dart';

import 'native_ads_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AdHelper.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NativeAdsPage(),
    );
  }
}

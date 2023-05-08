
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initBannerAd();
  }
  late BannerAd bannerAd;
  bool isAdLoaded = false;
  //var adunit = "ca-app-pub-1205306575743971/3484845985";
  var adunit = "ca-app-pub-3940256099942544/6300978111";
///banner function
 initBannerAd(){
    bannerAd = BannerAd(size: AdSize.banner,
        adUnitId: adunit,
        listener: BannerAdListener(
          onAdLoaded: (ad){
              setState(() {
                isAdLoaded = true;
              });
          },
          onAdFailedToLoad: (ad , error){
            ad.dispose();
            print(error);
          }

        ),
        request: AdRequest());
    bannerAd.load();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('banner ad'),
      ),
      body: Center(
        child: Text('hi'),
      ),
      bottomNavigationBar: isAdLoaded ? SizedBox(
        height: bannerAd.size.height.toDouble(),
        width: bannerAd.size.height.toDouble(),
         child: AdWidget(ad: bannerAd),
      ) : SizedBox(),
    );
  }
}

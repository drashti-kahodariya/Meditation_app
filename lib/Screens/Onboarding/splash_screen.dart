import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meditation_app/Routes/routes.dart';
import 'package:meditation_app/Utils/custom_widget.dart';
import 'package:meditation_app/generated/assets.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: Define the routes and set logic accordingly
    Timer(
      const Duration(seconds: 3),
      () =>
          //         GetStorage().read(AppPreferencesHelper.pUser) == null
          // ?
          Get.toNamed(Routes.welcomeScreen),
    );
    // :
    //         Get.offAllNamed(Routes.homeScreen));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        CustomWidget.customAssetImageWidget(
          image: Assets.assetsSplashBg,
          height: 100.h,
          width: 100.w,
          fit: BoxFit.cover,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 30.h,
              width: 50.w,
              child: CustomWidget.customAssetImageWidget(
                image: Assets.assetsLogo,
              ),
            ),
            CustomWidget.text("Meditation",
                fontSize: 30, fontWeight: FontWeight.w600),
            SizedBox(
              height: 2,
            ),
            CustomWidget.text(
                "Do meditation. Stay focused.\nLive a healthy life.",
                fontSize: 10,
                fontWeight: FontWeight.normal),
          ],
        ),
      ],
    ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/Controllers/premium_controller.dart';
import 'package:meditation_app/Utils/custom_widget.dart';
import 'package:meditation_app/generated/assets.dart';
import 'package:sizer/sizer.dart';

import '../Utils/constant.dart';

class SubScriptionScreen extends StatefulWidget {
  const SubScriptionScreen({Key? key}) : super(key: key);

  @override
  _SubScriptionScreenState createState() => _SubScriptionScreenState();
}

class _SubScriptionScreenState extends State<SubScriptionScreen> {
  final premiumController = Get.put(PremiumController());
  @override
  void initState() {
    premiumController.setPremium();
    premiumController.initStoreInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColor.whiteColor)),
                child: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Center(
                      child: Icon(
                    Icons.arrow_back_ios,
                    color: AppColor.whiteColor,
                  )),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomWidget.text("Unlock Mindfulness",
                    fontSize: 20, fontWeight: FontWeight.w500),
                SizedBox(
                  height: 1.h,
                ),
                CustomWidget.text(
                    "Subscribe now to get full access to the Sinnesro app.",
                    fontSize: 9,
                    color: AppColor.whiteColor.withOpacity(0.8)),
                SizedBox(
                  height: 4.h,
                ),
                customeSubscriptionDetails(
                    title: "Unlock  the full Sinnesro experience"),
                SizedBox(
                  height: 2.h,
                ),
                customeSubscriptionDetails(title: "A new meditation every day"),
                SizedBox(
                  height: 2.h,
                ),
                customeSubscriptionDetails(
                    title: "Sleep sound and bedtime exercises"),
                SizedBox(
                  height: 2.h,
                ),
                customeSubscriptionDetails(
                    title: "Move mode for mind and body fitness"),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(Assets.assetsMonthly),
                    Image.asset(Assets.assetsYearly)
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomWidget.customButton(
                    callBack: () {
                      premiumController
                          .getPremium()
                          .then((value) => setState(() {}));
                    },
                    height: 6.h,
                    width: 70.w,
                    btnText: "Try free and subscribe",
                    textColor: AppColor.whiteColor,
                    color: Color(0xffFFC700)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row customeSubscriptionDetails({required String title}) {
    return Row(
      children: [
        Image.asset(
          Assets.assetsUnlockIcon,
          height: 22,
        ),
        SizedBox(
          width: 2.w,
        ),
        CustomWidget.text(title, fontSize: 12),
      ],
    );
  }
}

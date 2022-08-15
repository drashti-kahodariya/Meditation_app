import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomWidget.customAssetImageWidget(
              image: Assets.assetsLogo,
              height: 3.h,
              width: 10.w,
            ),
            CustomWidget.text("Unlock Mindfulness",
                fontSize: 20, fontWeight: FontWeight.w500),
            SizedBox(
              height: 1.h,
            ),
            CustomWidget.text(
                "Subscribe now to get full access to the headspace app.",
                fontSize: 9,
                color: AppColor.whiteColor.withOpacity(0.8)),
            SizedBox(
              height: 4.h,
            ),
            customeSubscriptionDetails(
                title: "Unlock  the full Headspace experience"),
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
            CustomWidget.customButton(
                callBack: () {},
                height: 6.h,
                width: 70.w,
                btnText: "Try free and subscribe",
                textColor: AppColor.whiteColor,
                color: Color(0xffFFC700)),
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

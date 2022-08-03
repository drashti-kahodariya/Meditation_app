import 'package:flutter/material.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/Utils/custom_widget.dart';
import 'package:meditation_app/generated/assets.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 3.h,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                CustomWidget.text("Good\nMorning, Felix",
                    textAlign: TextAlign.start, fontWeight: FontWeight.w600),
                Spacer(),
                CustomWidget.customAssetImageWidget(
                  image: Assets.assetsHeart,
                ),
                SizedBox(
                  width: 4.w,
                ),
                CustomWidget.customAssetImageWidget(
                  image: Assets.assetsRecent,
                ),
                SizedBox(
                  width: 4.w,
                ),
                CustomWidget.customAssetImageWidget(
                  image: Assets.assetsNotification,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 8),
            child: Column(
              children: [
                CustomWidget.text("Start Your Day",
                    textAlign: TextAlign.start, fontWeight: FontWeight.w600),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

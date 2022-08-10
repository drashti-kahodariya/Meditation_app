import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/Routes/routes.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/Utils/custom_widget.dart';
import 'package:meditation_app/generated/assets.dart';
import 'package:sizer/sizer.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            SizedBox(
              height: 6.h,
            ),
            customExploreTile(
                image: Assets.assetsMeditateImage,
                icon: Assets.assetsMeditateIcon,
                title: "Meditate"),
            SizedBox(
              height: 5.h,
            ),
            customExploreTile(
                image: Assets.assetsSleepImage,
                icon: Assets.assetsSleepIcon,
                title: "Sleep"),
            SizedBox(
              height: 5.h,
            ),
            customExploreTile(
                image: Assets.assetsFocusImage,
                icon: Assets.assetsFocusIcon,
                title: "Focus"),
          ],
        ),
      ),
    );
  }

  GestureDetector customExploreTile(
      {required String image, required String icon, required String title}) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.musicPlayScreen);
      },
      child: Stack(
        children: [
          Container(
            height: 25.h,
            width: 100.w,
            decoration: CustomWidget.customBoxDecoration(
              borderRadius: 10,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  icon,
                  height: 30,
                  width: 30,
                ),
                CustomWidget.text(title)
              ],
            ),
          )
        ],
      ),
    );
  }
}

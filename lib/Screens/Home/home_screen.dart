import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/Routes/routes.dart';
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
      backgroundColor: AppColor.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
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
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.favouriteScreen);
                    },
                    child: CustomWidget.customAssetImageWidget(
                      image: Assets.assetsHeart,
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.recentScreen);
                    },
                    child: CustomWidget.customAssetImageWidget(
                      image: Assets.assetsRecent,
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.notificationScreen);
                    },
                    child: CustomWidget.customAssetImageWidget(
                      image: Assets.assetsNotification,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 28.0, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomWidget.text("Start Your Day",
                      textAlign: TextAlign.start, fontWeight: FontWeight.w600),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    height: 75.h,
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 22.h,
                          width: 100.w,
                          decoration: CustomWidget.customBoxDecoration(
                              borderRadius: 18, borderColor: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomWidget.text("Happy \nMorning",
                                        textAlign: TextAlign.start,
                                        fontWeight: FontWeight.w600),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomWidget.customAssetImageWidget(
                                            image: Assets.assetsVolumeUp,
                                            height: 2.5),
                                        CustomWidget.text("Mindful activity",
                                            textAlign: TextAlign.start,
                                            fontSize: 10,
                                            maxLine: 1,
                                            overflow: TextOverflow.ellipsis,
                                            color: AppColor.subtitleColor),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    Row(
                                      children: [
                                        CustomWidget.customAssetImageWidget(
                                            image: Assets.assetsClock,
                                            height: 2.3),
                                        CustomWidget.text(
                                          "1 - 2 Min",
                                          textAlign: TextAlign.start,
                                          fontSize: 10,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Container(
                                    height: 20.h,
                                    width: 40.w,
                                    decoration:
                                        CustomWidget.customBoxDecoration(
                                      borderRadius: 10,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child:
                                          CustomWidget.customAssetImageWidget(
                                              image: Assets.assetsDummy,
                                              fit: BoxFit.cover),
                                    ))
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 2.h,
                        );
                      },
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 0.5.h,
                      ),
                      CustomWidget.text(
                        "Your afternoon lift",
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      Container(
                        height: 22.h,
                        width: 100.w,
                        decoration: CustomWidget.customBoxDecoration(
                            borderRadius: 18, borderColor: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomWidget.text("Happy \nMorning",
                                      textAlign: TextAlign.start,
                                      fontWeight: FontWeight.w600),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomWidget.customAssetImageWidget(
                                          image: Assets.assetsVolumeUp,
                                          height: 2.5),
                                      CustomWidget.text("Mindful activity",
                                          textAlign: TextAlign.start,
                                          fontSize: 10,
                                          maxLine: 1,
                                          overflow: TextOverflow.ellipsis,
                                          color: AppColor.subtitleColor),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Row(
                                    children: [
                                      CustomWidget.customAssetImageWidget(
                                          image: Assets.assetsClock,
                                          height: 2.3),
                                      CustomWidget.text(
                                        "1 - 2 Min",
                                        textAlign: TextAlign.start,
                                        fontSize: 10,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                height: 20.h,
                                width: 40.w,
                                decoration: CustomWidget.customBoxDecoration(
                                  borderRadius: 10,
                                ),
                                child: CustomWidget.customAssetImageWidget(
                                    image: Assets.assetsDummy,
                                    fit: BoxFit.cover),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 2.5.h,
                      ),
                      CustomWidget.text(
                        "At Night",
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      Container(
                        height: 22.h,
                        width: 100.w,
                        decoration: CustomWidget.customBoxDecoration(
                            borderRadius: 18, borderColor: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomWidget.text("Happy \nMorning",
                                      textAlign: TextAlign.start,
                                      fontWeight: FontWeight.w600),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomWidget.customAssetImageWidget(
                                          image: Assets.assetsVolumeUp,
                                          height: 2.5),
                                      CustomWidget.text("Mindful activity",
                                          textAlign: TextAlign.start,
                                          fontSize: 10,
                                          maxLine: 1,
                                          overflow: TextOverflow.ellipsis,
                                          color: AppColor.subtitleColor),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Row(
                                    children: [
                                      CustomWidget.customAssetImageWidget(
                                          image: Assets.assetsClock,
                                          height: 2.3),
                                      CustomWidget.text(
                                        "1 - 2 Min",
                                        textAlign: TextAlign.start,
                                        fontSize: 10,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                height: 20.h,
                                width: 40.w,
                                decoration: CustomWidget.customBoxDecoration(
                                  borderRadius: 10,
                                ),
                                child: CustomWidget.customAssetImageWidget(
                                    image: Assets.assetsDummy,
                                    fit: BoxFit.cover),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

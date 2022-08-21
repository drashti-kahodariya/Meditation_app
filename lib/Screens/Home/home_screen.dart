import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/Controllers/authentication_controller.dart';
import 'package:meditation_app/Controllers/home_controller.dart';
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
  var homeController = Get.put(HomeController());
  var authController = Get.put(AuthenticationController());

  @override
  void initState() {
    authController.setCurrentUser();
    homeController.getDashboardMeditation();

    super.initState();
  }

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
                  CustomWidget.text("${homeController.greetingMessage()},123",
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
                    child: Obx(() {
                      return ListView.separated(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: homeController.dashboardMeditationList
                            .value[0].startYourDay!.length!,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.subscriptionScreen);
                            },
                            child: Container(
                              height: 22.h,
                              width: 100.w,
                              decoration: CustomWidget.customBoxDecoration(
                                  borderRadius: 18, borderColor: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomWidget.text(
                                            homeController
                                                .dashboardMeditationList
                                                .value[0]
                                                .startYourDay![index]
                                                .title!,
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
                                            CustomWidget.text(
                                                homeController
                                                    .dashboardMeditationList
                                                    .value[0]
                                                    .startYourDay![index]
                                                    .description!,
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
                                        child: CachedNetworkImage(
                                          imageUrl: homeController
                                              .dashboardMeditationList
                                              .value[0]
                                              .startYourDay![index]
                                              .image!,
                                          fit: BoxFit.cover,
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                              CupertinoActivityIndicator(),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 2.h,
                          );
                        },
                      );
                    }),
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
                      Obx(() {
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
                                    CustomWidget.text(
                                        homeController.dashboardMeditationList
                                            .value[0].afternoonLift![0].title!,
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
                                        CustomWidget.text(
                                            homeController
                                                .dashboardMeditationList
                                                .value[0]
                                                .afternoonLift![0]
                                                .description!,
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
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      imageUrl: homeController
                                          .dashboardMeditationList
                                          .value[0]
                                          .afternoonLift![0]
                                          .image!,
                                      fit: BoxFit.cover,
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) =>
                                              CupertinoActivityIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
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
                      Obx(() {
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
                                    CustomWidget.text(
                                        homeController.dashboardMeditationList
                                            .value[0].atNight![0].title!,
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
                                        CustomWidget.text(
                                            homeController
                                                .dashboardMeditationList
                                                .value[0]
                                                .atNight![0]
                                                .description!,
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
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      imageUrl: homeController
                                          .dashboardMeditationList
                                          .value[0]
                                          .atNight![0]
                                          .image!,
                                      fit: BoxFit.cover,
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) =>
                                              CupertinoActivityIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                      SizedBox(
                        height: 2.5.h,
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

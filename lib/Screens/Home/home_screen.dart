import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/Controllers/authentication_controller.dart';
import 'package:meditation_app/Controllers/home_controller.dart';
import 'package:meditation_app/Data/Model/dashboard_meditation_model.dart';
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
        physics: BouncingScrollPhysics(),
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
                  CustomWidget.text("${homeController.greetingMessage()}, Felix",
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w400,
                      color: AppColor.whiteColor.withOpacity(0.7),
                      fontSize: 12),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.favouriteScreen);
                    },
                    child: CustomWidget.customAssetImageWidget(
                      image: Assets.assetsHeart,
                      height: 3.0
                    ),
                  ),
                  SizedBox(width: 4.w),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.recentScreen);
                    },
                    child: CustomWidget.customAssetImageWidget(
                      image: Assets.assetsRecent,
                        height: 3.0

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
                        height: 3.0

                    ),
                  )
                ],
              ),
            ),
            Obx(
              () => homeController.dashboardMeditationList.isEmpty
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28.0, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomWidget.text("Start Your Day",
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.w600),
                          SizedBox(
                            height: 2.h,
                          ),
                          Obx(() {
                            return ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemCount: homeController
                                  .dashboardMeditationList[0]
                                  .startYourDay!
                                  .length,
                              itemBuilder: (context, index) {
                                return dashboardCourseCard(homeController
                                    .dashboardMeditationList[0]
                                    .startYourDay![index]);
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  height: 2.h,
                                );
                              },
                            );
                          }),
                          SizedBox(
                            height: 2.h,
                          ),
                          CustomWidget.text("Your afternoon lift",
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.w600),
                          SizedBox(height: 2.h),
                          Obx(() {
                            return dashboardCourseCard(homeController
                                .dashboardMeditationList[0].afternoonLift![0]);
                          }),
                          SizedBox(height: 2.5.h),
                          CustomWidget.text("At Night",
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.w600),
                          SizedBox(
                            height: 2.5.h,
                          ),
                          Obx(() {
                            return dashboardCourseCard(homeController
                                .dashboardMeditationList[0].atNight![0]);
                          }),
                          SizedBox(
                            height: 2.5.h,
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector dashboardCourseCard(StartYourDay course) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.subscriptionScreen);
      },
      child: Container(
        height: 22.h,
        width: 100.w,
        decoration: CustomWidget.customBoxDecoration(
            borderRadius: 10,
            borderWidth: 1,
            borderColor: AppColor.primaryColor.withOpacity(0.5)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomWidget.text(course.title!,
                        maxLine: 3,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w600),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomWidget.customAssetImageWidget(
                            image: Assets.assetsVolumeUp,
                            color: AppColor.whiteColor.withOpacity(0.5),
                            height: 2),
                        CustomWidget.text(course.description!,
                            textAlign: TextAlign.start,
                            fontSize: 10,
                            maxLine: 1,
                            overflow: TextOverflow.ellipsis,
                            color: AppColor.whiteColor.withOpacity(0.5)),
                      ],
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Row(
                      children: [
                        CustomWidget.customAssetImageWidget(
                            image: Assets.assetsClock,
                            color: AppColor.whiteColor.withOpacity(0.5),
                            height: 2),
                        CustomWidget.text("1 - 2 Min",
                            textAlign: TextAlign.start,
                            fontSize: 10,
                            color: AppColor.whiteColor.withOpacity(0.5)),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 18.h,
                width: 40.w,
                decoration: CustomWidget.customBoxDecoration(
                  borderRadius: 10,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: course.image!,
                    fit: BoxFit.cover,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            const CupertinoActivityIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

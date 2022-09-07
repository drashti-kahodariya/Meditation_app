import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/Controllers/authentication_controller.dart';
import 'package:meditation_app/Controllers/home_controller.dart';
import 'package:meditation_app/Data/Model/episode_model.dart';
import 'package:meditation_app/Routes/routes.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/Utils/custom_widget.dart';
import 'package:meditation_app/generated/assets.dart';
import 'package:meditation_app/generated/l10n.dart';
import 'package:path/path.dart' as p;
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      authController.setCurrentUser();
      homeController.getDashboardMeditation();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    Obx(() {
                      return CustomWidget.text(
                          "${homeController.greetingMessage()}, ${authController.currentUserData.value.firstName}",
                          textAlign: TextAlign.start,
                          fontWeight: FontWeight.w400,
                          color: AppColor.whiteColor,
                          fontSize: 16);
                    }),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.favouriteScreen);
                      },
                      child: CustomWidget.customAssetImageWidget(
                          image: Assets.assetsHeartOutline, height: 3.0),
                    ),
                    SizedBox(width: 4.w),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.recentScreen);
                      },
                      child: CustomWidget.customAssetImageWidget(
                          image: Assets.assetsRecent, height: 3.0),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.notificationScreen);
                      },
                      child: CustomWidget.customAssetImageWidget(
                          image: Assets.assetsNotification, height: 3.0),
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
                            CustomWidget.text(S.of(context).startYourDay,
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
                            CustomWidget.text(S.of(context).yourAfternoonLift,
                                textAlign: TextAlign.start,
                                fontWeight: FontWeight.w600),
                            SizedBox(height: 2.h),
                            Obx(() {
                              return dashboardCourseCard(homeController
                                  .dashboardMeditationList[0]
                                  .afternoonLift![0]);
                            }),
                            SizedBox(height: 2.5.h),
                            CustomWidget.text(S.of(context).atNight,
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
      ),
    );
  }

  GestureDetector dashboardCourseCard(EpisodeData course) {
    return GestureDetector(
      onTap: () {
        homeController.addInRecent(course);
        final extension = p.extension(course.audioOrVideo!);
        if (extension == ".mp3") {
          Get.toNamed(Routes.musicPlayScreen, arguments: course);
        } else {
          Get.toNamed(Routes.videoPlayScreen, arguments: course);
        }
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
                        Container(
                          width: 30.w,
                          child: CustomWidget.text(course.description!,
                              textAlign: TextAlign.start,
                              fontSize: 10,
                              maxLine: 1,
                              overflow: TextOverflow.ellipsis,
                              color: AppColor.whiteColor.withOpacity(0.5)),
                        ),
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
                    progressIndicatorBuilder: (context, url,
                            downloadProgress) =>
                        const CupertinoActivityIndicator(color: Colors.white),
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

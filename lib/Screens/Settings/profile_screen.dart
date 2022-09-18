import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/Controllers/authentication_controller.dart';
import 'package:meditation_app/Controllers/home_controller.dart';
import 'package:meditation_app/Routes/routes.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/Utils/custom_widget.dart';
import 'package:meditation_app/generated/assets.dart';
import 'package:meditation_app/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var authController = Get.put(AuthenticationController());
  var homeController = Get.put(HomeController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      authController.setCurrentUser();
      homeController.getAndSetRecent();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Stack(
        children: [
          Image.asset(
            Assets.assetsSettingBg,
            height: 100.0.h,
            width: 100.0.w,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.settingScreen);
                      },
                      child: Image.asset(
                        Assets.assetsSettingIcon,
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6.h,
                ),
                authController.currentUserData.value.image == null
                    ? Center(
                        child: CircleAvatar(
                          backgroundColor: AppColor.whiteColor.withOpacity(0.2),
                          maxRadius: 60,
                          child: Padding(
                            padding: const EdgeInsets.all(33.0),
                            child: Image.asset(
                              Assets.assetsEditUser,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: CircleAvatar(
                          maxRadius: 60,
                          backgroundColor: AppColor.primaryColor,
                          backgroundImage: NetworkImage(
                              authController.currentUserData.value.image!),
                        ),
                      ),
                CustomWidget.text(S.of(context).stats),
                SizedBox(height: 2.5.h),
                Row(
                  children: [
                    Image.asset(
                      Assets.assetsChronometer,
                      height: 45,
                      width: 45,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomWidget.text("7 Minutes", fontSize: 12),
                        CustomWidget.text(S.of(context).averageMeditationLength,
                            fontSize: 10,
                            color: AppColor.whiteColor.withOpacity(0.5)),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    Image.asset(
                      Assets.assetsDeadline,
                      height: 45,
                      width: 45,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomWidget.text("30 Minutes", fontSize: 12),
                        CustomWidget.text(S.of(context).totalMeditationTime,
                            fontSize: 10,
                            color: AppColor.whiteColor.withOpacity(0.5)),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    Image.asset(
                      Assets.assetsPlayButton,
                      height: 45,
                      width: 45,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Obx(() {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomWidget.text(
                              "${homeController.recentList.length} Sessions",
                              fontSize: 12),
                          CustomWidget.text(S.of(context).sessionsCompleted,
                              fontSize: 10,
                              color: AppColor.whiteColor.withOpacity(0.5)),
                        ],
                      );
                    })
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

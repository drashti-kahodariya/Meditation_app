import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/Controllers/authentication_controller.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/Utils/custom_widget.dart';
import 'package:meditation_app/generated/assets.dart';
import 'package:sizer/sizer.dart';

import '../../Routes/routes.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  var authController = Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Column(
        children: [
          CustomWidget.customAppBar(title: "Setting"),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                customSettingTile(
                    icon: Assets.assetsSettingUser,
                    title: "Account Information",
                    onTap: () {
                      Get.toNamed(Routes.editProfileScreen);
                    }),
                SizedBox(
                  height: 3.h,
                ),
                customSettingTile(
                    icon: Assets.assetsInvite,
                    title: "Invite Friend",
                    onTap: () {
                      Get.toNamed(Routes.inviteFriendsScreen);
                    }),
                SizedBox(
                  height: 3.h,
                ),
                customSettingTile(
                    icon: Assets.assetsNotification,
                    title: "Notification",
                    onTap: () {
                      Get.toNamed(Routes.notificationScreen);
                    }),
                SizedBox(
                  height: 3.h,
                ),
                customSettingTile(
                    icon: Assets.assetsMyData,
                    title: "My Data",
                    onTap: () {
                      Get.toNamed(Routes.supportScreen, arguments: "My Data");
                    }),
                SizedBox(
                  height: 3.h,
                ),
                customSettingTile(
                    icon: Assets.assetsTermsCondition,
                    title: "Terms & Conditions",
                    onTap: () {
                      Get.toNamed(Routes.supportScreen,
                          arguments: "Terms & Conditions");
                    }),
                SizedBox(
                  height: 3.h,
                ),
                customSettingTile(
                    icon: Assets.assetsDownload,
                    title: "Downloads",
                    onTap: () {
                      Get.toNamed(Routes.downloadsScreen);
                    }),
                SizedBox(
                  height: 3.h,
                ),
                customSettingTile(
                    icon: Assets.assetsPrivacyPolicy,
                    title: "Privacy Policy",
                    onTap: () {
                      Get.toNamed(Routes.supportScreen,
                          arguments: "Privacy Policy");
                    }),
                SizedBox(
                  height: 3.h,
                ),
                customSettingTile(
                    icon: Assets.assetsSupport,
                    title: "Support",
                    onTap: () {
                      Get.toNamed(Routes.supportScreen, arguments: "Support");
                    }),
                SizedBox(
                  height: 3.h,
                ),
                customSettingTile(
                    icon: Assets.assetsLogout,
                    title: "Log Out",
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return CustomWidget.alertDialog();
                          });
                      // authController.logOut();
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }

  GestureDetector customSettingTile(
      {required String title, required String icon, Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(icon, height: 30, width: 30),
          SizedBox(
            width: 3.w,
          ),
          CustomWidget.text(title, fontSize: 15),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: AppColor.whiteColor,
            size: 22,
          )
        ],
      ),
    );
  }
}

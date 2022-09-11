import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meditation_app/Controllers/authentication_controller.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/Utils/custom_widget.dart';
import 'package:meditation_app/generated/assets.dart';
import 'package:meditation_app/generated/l10n.dart';
import 'package:sizer/sizer.dart';

import '../../Routes/routes.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  var authController = Get.put(AuthenticationController());
  var isEnglish = true.obs;

  @override
  void initState() {
    if (GetStorage().read(AppPreferencesHelper.language) != null) {
      isEnglish.value = GetStorage().read(AppPreferencesHelper.language);
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Column(
        children: [
          CustomWidget.customAppBar(title: S.of(context).setting),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                customSettingTile(
                    icon: Assets.assetsSettingUser,
                    title: S.of(context).accountInformation,
                    onTap: () {
                      Get.toNamed(Routes.editProfileScreen);
                    }),
                SizedBox(
                  height: 4.h,
                ),
                Obx(() {
                  return Row(
                    children: [
                      Image.asset(
                        Assets.assetsLanguage,
                        height: 30,
                        width: 30,
                        color: AppColor.whiteColor,
                      ),
                      SizedBox(width: 3.w),
                      CustomWidget.text(
                          isEnglish.value ? "English" : "Swedish"),
                      const Spacer(),
                      CupertinoSwitch(
                        value: isEnglish.value,
                        thumbColor: AppColor.whiteColor,
                        trackColor: AppColor.primaryColor.withOpacity(0.5),
                        activeColor: AppColor.primaryColor,
                        onChanged: (bool? value) {
                          isEnglish.value = value!;
                          !isEnglish.value
                              ? Get.updateLocale(const Locale('sv'))
                              : Get.updateLocale(const Locale('en'));
                          GetStorage().write(
                              AppPreferencesHelper.language, isEnglish.value);
                          print(
                              GetStorage().read(AppPreferencesHelper.language));
                        },
                      ),
                    ],
                  );
                }),
                SizedBox(
                  height: 4.h,
                ),
                customSettingTile(
                    icon: Assets.assetsInvite,
                    title: S.of(context).inviteFriend,
                    onTap: () {
                      Get.toNamed(Routes.inviteFriendsScreen);
                    }),
                SizedBox(
                  height: 4.h,
                ),
                customSettingTile(
                    icon: Assets.assetsNotification,
                    title: S.of(context).inbox,
                    onTap: () {
                      Get.toNamed(Routes.notificationScreen);
                    }),
                SizedBox(
                  height: 4.h,
                ),
                customSettingTile(
                    icon: Assets.assetsMyData,
                    title: S.of(context).myData,
                    onTap: () {
                      Get.toNamed(Routes.supportScreen, arguments: "My Data");
                    }),
                SizedBox(
                  height: 4.h,
                ),
                customSettingTile(
                    icon: Assets.assetsTermsCondition,
                    title: S.of(context).termsConditions,
                    onTap: () {
                      Get.toNamed(Routes.supportScreen,
                          arguments: "Terms & Conditions");
                    }),
                SizedBox(
                  height: 4.h,
                ),
                customSettingTile(
                    icon: Assets.assetsDownload,
                    title: S.of(context).downloads,
                    onTap: () {
                      Get.toNamed(Routes.downloadsScreen);
                    }),
                SizedBox(
                  height: 4.h,
                ),
                customSettingTile(
                    icon: Assets.assetsPrivacyPolicy,
                    title: S.of(context).privacyPolicy,
                    onTap: () {
                      Get.toNamed(Routes.supportScreen,
                          arguments: "Privacy Policy");
                    }),
                SizedBox(
                  height: 4.h,
                ),
                customSettingTile(
                    icon: Assets.assetsSupport,
                    title: S.of(context).support,
                    onTap: () {
                      Get.toNamed(Routes.supportScreen, arguments: "Support");
                    }),
                SizedBox(
                  height: 4.h,
                ),
                customSettingTile(
                    icon: Assets.assetsLogout,
                    title: S.of(context).logOut,
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
          SizedBox(width: 3.w),
          CustomWidget.text(title, fontSize: 15),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
            color: AppColor.whiteColor,
            size: 22,
          )
        ],
      ),
    );
  }
}

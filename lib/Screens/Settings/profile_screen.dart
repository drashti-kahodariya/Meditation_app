import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/Controllers/authentication_controller.dart';
import 'package:meditation_app/Routes/routes.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/Utils/custom_widget.dart';
import 'package:meditation_app/generated/assets.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var authController = Get.put(AuthenticationController());

  @override
  void initState() {
    authController.setCurrentUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Obx(() {
          return Column(
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
                  : CircleAvatar(
                      maxRadius: 60,
                      backgroundColor: AppColor.primaryColor,
                      backgroundImage: NetworkImage(
                          authController.currentUserData.value.image!),
                    ),
              SizedBox(
                height: 1.h,
              ),
              authController.currentUserData.value.firstName == null
                  ? Container()
                  : CustomWidget.text(
                      authController.currentUserData.value.firstName! +
                          " " +
                          authController.currentUserData.value.lastName!,
                      maxLine: 1),
              SizedBox(
                height: 2.h,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 18.w,
                  ),
                  Image.asset(
                    Assets.assetsEmailIcon,
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  CustomWidget.text(
                      "${authController.currentUserData.value.email!}",
                      maxLine: 1,
                      fontSize: 13),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              authController.currentUserData.value.mobileNumber == null
                  ? Container()
                  : Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 18.w,
                        ),
                        Image.asset(
                          Assets.assetsPhone,
                          height: 20,
                          width: 20,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        CustomWidget.text(
                            authController.currentUserData.value.mobileNumber!,
                            maxLine: 1,
                            fontSize: 13),
                      ],
                    ),
              SizedBox(
                height: 4.h,
              ),
              CustomPracticeContainer(
                  icon: Assets.assetsPracticesIcon, title: "Practices"),
              SizedBox(
                height: 4.h,
              ),
              CustomPracticeContainer(
                  icon: Assets.assetsMeditationsIcon, title: "Meditations")
            ],
          );
        }),
      ),
    );
  }

  Container CustomPracticeContainer(
      {required String title, required String icon}) {
    return Container(
      height: 18.h,
      width: 100.w,
      decoration: CustomWidget.customBoxDecoration(
        borderRadius: 22,
        color: AppColor.whiteColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  icon,
                  height: 32,
                  width: 32,
                ),
                SizedBox(
                  width: 2.w,
                ),
                CustomWidget.text(title,
                    fontSize: 17,
                    color: AppColor.blackColor,
                    fontWeight: FontWeight.w400),
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20.w,
                ),
                CustomWidget.text("Time:",
                    fontSize: 12, color: AppColor.blackColor.withOpacity(0.5)),
                SizedBox(
                  width: 1.w,
                ),
                CustomWidget.text("4:23:04",
                    fontSize: 18, color: AppColor.blackColor),
              ],
            )
          ],
        ),
      ),
    );
  }
}

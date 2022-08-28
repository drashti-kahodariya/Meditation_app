import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/Controllers/authentication_controller.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/Utils/custom_widget.dart';
import 'package:meditation_app/generated/assets.dart';
import 'package:sizer/sizer.dart';

import '../../Routes/routes.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  var authController = AuthenticationController();
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomWidget.customAppBar(title: "Forgot Password"),
            Column(
              children: [
                CustomWidget.customAssetImageWidget(
                  image: Assets.assetsForgotPassword,
                  height: 5.h,
                  width: 50.w,
                ),
                SizedBox(
                  height: 4.h,
                ),
                CustomWidget.text("Did someone forget their password ?",
                    fontSize: 13,
                    color: AppColor.whiteColor,
                    fontWeight: FontWeight.bold),
                SizedBox(
                  height: 1.h,
                ),
                CustomWidget.text("That's ok",
                    fontSize: 10, color: AppColor.whiteColor.withOpacity(0.8)),
                SizedBox(
                  height: 2.h,
                ),
                CustomWidget.text(
                    "Just enter the email address you’ve used \n to register with us and we’ll send you \n a reset link !",
                    fontSize: 10,
                    color: AppColor.whiteColor.withOpacity(0.8)),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: TextFormField(
                    controller: _emailController,
                    style: const TextStyle(color: AppColor.whiteColor),
                    decoration: CustomWidget.customInputDecoration(
                        hintText: "Email Address"),
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                CustomWidget.customButton(
                    callBack: () {
                      if (_emailController.text.isNotEmpty) {
                        print("ok");
                        // authController.forgotPassword(
                        //     {"email": "drashtikahodariya966@gmail.com"});
                        Get.toNamed(Routes.otpVerificationScreen);
                      } else {
                        CustomWidget.errorSnackBar(content: 'Enter email!');
                      }
                    },
                    height: 6.h,
                    width: 70.w,
                    btnText: "Submit",
                    textColor: AppColor.whiteColor,
                    color: Color(0xffFFC700)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

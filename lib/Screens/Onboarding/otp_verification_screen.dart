import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:meditation_app/Controllers/authentication_controller.dart';
import 'package:meditation_app/Routes/routes.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/Utils/custom_widget.dart';
import 'package:meditation_app/generated/assets.dart';
import 'package:sizer/sizer.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  var authController = AuthenticationController();
  var verificationCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.assetsForgotPasswordImage,
              height: 25.h,
              width: 60.w,
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomWidget.text("Code has sent to your email address",
                fontSize: 15),
            SizedBox(
              height: 2.h,
            ),
            Center(
              child: OtpTextField(
                numberOfFields: 6,
                // borderRadius: BorderRadius.circular(15),
                borderColor: AppColor.primaryColor,
                // fieldWidth: 45,
                //set to true to show as box or false to show as dash
                showFieldAsBox: false,
                textStyle: TextStyle(fontSize: 25, color: AppColor.whiteColor),
                focusedBorderColor: AppColor.primaryColor,
                cursorColor: AppColor.primaryColor,
                clearText: false,

                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String value) {
                  verificationCode = value;
                  setState(() {});
                }, // end onSubmit
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            CustomWidget.text("Haven’t received the verification code?",
                fontSize: 12, color: AppColor.whiteColor.withOpacity(0.6)),
            CustomWidget.text("Resend",
                fontSize: 14, color: AppColor.yellowColor),
            SizedBox(
              height: 7.h,
            ),
            CustomWidget.customButton(
                callBack: () {
                  Get.toNamed(Routes.setNewPasswordScreen);
                  // authController.otpVerification({"otp": verificationCode});
                },
                height: 6.h,
                width: 70.w,
                btnText: "Verify",
                textColor: AppColor.whiteColor,
                color: AppColor.primaryColor),
          ],
        ),
      ),
    );
  }
}

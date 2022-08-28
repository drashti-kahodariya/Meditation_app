import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/Utils/custom_widget.dart';
import 'package:meditation_app/generated/assets.dart';
import 'package:sizer/sizer.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.assetsForgotPasswordImage,
              height: 25.h,
              width: 60.w,
            ),
            CustomWidget.text("Create new password", fontSize: 15),
            SizedBox(
              height: 1.h,
            ),
            CustomWidget.text(
                "Your new  password must be different from previous used passwords.",
                fontSize: 12,
                color: AppColor.whiteColor.withOpacity(0.6)),
            SizedBox(
              height: 4.h,
            ),
            TextFormField(
              controller: _passwordController,
              style: TextStyle(color: AppColor.whiteColor),
              decoration: CustomWidget.customInputDecoration(
                hintText: "New Password",
                suffixIcon: CupertinoIcons.eye,
              ),
              obscureText: true,
              validator: (v) {
                if (v!.isEmpty) {
                  return "Please enter password!";
                } else if (v.startsWith(" ")) {
                  return "Space not allow!";
                }
              },
            ),
            SizedBox(
              height: 2.h,
            ),
            TextFormField(
              controller: _passwordController,
              style: TextStyle(color: AppColor.whiteColor),
              decoration: CustomWidget.customInputDecoration(
                hintText: "Confirm Password",
                suffixIcon: CupertinoIcons.eye,
              ),
              obscureText: true,
              validator: (v) {
                if (v!.isEmpty) {
                  return "Please enter password!";
                } else if (v.startsWith(" ")) {
                  return "Space not allow!";
                }
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomWidget.customButton(
                callBack: () {
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

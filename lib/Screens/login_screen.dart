import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/Controllers/authentication_controller.dart';
import 'package:meditation_app/Routes/routes.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/Utils/custom_widget.dart';
import 'package:meditation_app/generated/assets.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var authenticationController = Get.put(AuthenticationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          alignment: Alignment.center,
          children: [
            CustomWidget.customAssetImageWidget(
                image: Assets.assetsLoginBg,
                height: 100.h,
                width: 100.w,
                fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 7.h,
                  ),
                  Container(
                    height: 19.h,
                    width: 30.w,
                    child: CustomWidget.customAssetImageWidget(
                      image: Assets.assetsLogo,
                    ),
                  ),
                  CustomWidget.text("Login",
                      fontSize: 30, fontWeight: FontWeight.w600),
                  SizedBox(
                    height: 6.h,
                  ),
                  TextFormField(
                    controller: _emailController,
                    style: const TextStyle(color: AppColor.whiteColor),
                    decoration: CustomWidget.customInputDecoration(
                        hintText: "Email Address"),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    style: TextStyle(color: AppColor.whiteColor),
                    decoration: CustomWidget.customInputDecoration(
                      hintText: "Password",
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomWidget.text("Forgot Password?", fontSize: 11),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomWidget.customButton(
                      callBack: () {
                        Get.toNamed(Routes.homeScreen);
                      },
                      height: 6.h,
                      width: 70.w,
                      btnText: "Login",
                      textColor: AppColor.whiteColor,
                      color: AppColor.lightPrimaryColor),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomWidget.text("Don’t have an account?", fontSize: 11),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.signUpScreen);
                        },
                        child: CustomWidget.text(" Register",
                            fontSize: 11,
                            color: AppColor.yellowColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

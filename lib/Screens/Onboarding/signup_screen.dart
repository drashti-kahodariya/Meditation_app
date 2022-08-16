import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/Controllers/authentication_controller.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/Utils/custom_widget.dart';
import 'package:meditation_app/generated/assets.dart';
import 'package:sizer/sizer.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _fNameController = TextEditingController();
  final _lNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var authenticationController = Get.put(AuthenticationController());
  final _formKey = GlobalKey<FormState>();
  RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _fNameController.dispose();
    _lNameController.dispose();
    super.dispose();
  }

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
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
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
                      CustomWidget.text("Register",
                          fontSize: 30, fontWeight: FontWeight.w600),
                      SizedBox(
                        height: 6.h,
                      ),
                      TextFormField(
                        controller: _fNameController,
                        style: TextStyle(color: AppColor.whiteColor),
                        decoration: CustomWidget.customInputDecoration(
                            hintText: "First Name"),
                        validator: (v) {
                          if (v!.isEmpty) {
                            return "Please enter first name!";
                          } else if (v.startsWith(" ")) {
                            return "Space not allow!";
                          }
                        },
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      TextFormField(
                        controller: _lNameController,
                        style: TextStyle(color: AppColor.whiteColor),
                        decoration: CustomWidget.customInputDecoration(
                          hintText: "Last Name",
                        ),
                        validator: (v) {
                          if (v!.isEmpty) {
                            return "Please enter last name!";
                          } else if (v.startsWith(" ")) {
                            return "Space not allow!";
                          }
                        },
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      TextFormField(
                        controller: _emailController,
                        style: TextStyle(color: AppColor.whiteColor),
                        decoration: CustomWidget.customInputDecoration(
                            hintText: "Email Address"),
                        validator: (v) {
                          if (v!.isEmpty) {
                            return "Please enter email address!";
                          } else if (v.startsWith(" ")) {
                            return "Space not allow!";
                          } else if (!emailRegex.hasMatch(v)) {
                            return 'Enter valid email';
                          }
                        },
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        style: TextStyle(color: AppColor.whiteColor),
                        decoration: CustomWidget.customInputDecoration(
                          hintText: "Password",
                        ),
                        validator: (v) {
                          if (v!.isEmpty) {
                            return "Please enter password!";
                          } else if (v.startsWith(" ")) {
                            return "Space not allow!";
                          }
                        },
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomWidget.customButton(
                          callBack: () {
                            if (_formKey.currentState!.validate()) {
                              authenticationController.signUp({
                                "firstName": _fNameController.text,
                                "lastName": _lNameController.text,
                                "email": _emailController.text,
                                "password": _passwordController.text
                              });
                            }
                          },
                          height: 6.h,
                          width: 70.w,
                          btnText: "Register",
                          textColor: AppColor.whiteColor,
                          color: AppColor.primaryColor),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomWidget.text("Already have an account?",
                              fontSize: 11),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: CustomWidget.text("  Login",
                                fontSize: 11,
                                color: AppColor.yellowColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

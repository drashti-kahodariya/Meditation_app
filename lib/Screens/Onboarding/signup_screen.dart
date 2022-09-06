import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/Controllers/authentication_controller.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/Utils/custom_widget.dart';
import 'package:meditation_app/generated/assets.dart';
import 'package:meditation_app/generated/l10n.dart';
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
  final _mobileNoController = TextEditingController();
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
                        height: 5.h,
                      ),
                      Container(
                        height: 19.h,
                        width: 30.w,
                        child: CustomWidget.customAssetImageWidget(
                          image: Assets.assetsLogo,
                        ),
                      ),
                      CustomWidget.text(S.of(context).register,
                          fontSize: 30, fontWeight: FontWeight.w600),
                      SizedBox(
                        height: 3.h,
                      ),
                      TextFormField(
                        controller: _fNameController,
                        style: TextStyle(color: AppColor.whiteColor),
                        decoration: CustomWidget.customInputDecoration(
                            hintText: S.of(context).firstName),
                        validator: (v) {
                          if (v!.isEmpty) {
                            return S.of(context).enterFirstName;
                          } else if (v.startsWith(" ")) {
                            return S.of(context).spaceNotAllow;
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
                          hintText: S.of(context).lastName,
                        ),
                        validator: (v) {
                          if (v!.isEmpty) {
                            return S.of(context).enterLastName;
                          } else if (v.startsWith(" ")) {
                            return S.of(context).spaceNotAllow;
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
                            hintText: S.of(context).emailAddress),
                        validator: (v) {
                          if (v!.isEmpty) {
                            return S.of(context).enterEmail;
                          } else if (v.startsWith(" ")) {
                            return S.of(context).spaceNotAllow;
                          } else if (!emailRegex.hasMatch(v)) {
                            return S.of(context).validEmail;
                          }
                        },
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      TextFormField(
                        controller: _mobileNoController,
                        style: TextStyle(color: AppColor.whiteColor),
                        keyboardType: TextInputType.number,
                        decoration: CustomWidget.customInputDecoration(
                            hintText: S.of(context).mobileNo),
                        validator: (v) {
                          if (v!.startsWith(" ")) {
                            return S.of(context).spaceNotAllow;
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
                          hintText: S.of(context).password,
                        ),
                        obscureText: true,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return S.of(context).enterPassword;
                          } else if (v.startsWith(" ")) {
                            return S.of(context).spaceNotAllow;
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
                          btnText: S.of(context).register,
                          textColor: AppColor.whiteColor,
                          color: AppColor.primaryColor),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomWidget.text(S.of(context).alreadyHaveAnAccount,
                              fontSize: 11),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: CustomWidget.text("  ${S.of(context).login}",
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

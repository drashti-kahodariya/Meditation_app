import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/Controllers/authentication_controller.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/Utils/custom_widget.dart';
import 'package:meditation_app/generated/assets.dart';
import 'package:meditation_app/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  final _passwordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  var authController = AuthenticationController();

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
            CustomWidget.text(S.of(context).createNewPassword, fontSize: 15),
            SizedBox(
              height: 1.h,
            ),
            CustomWidget.text(
                S
                    .of(context)
                    .yourNewPasswordMustBeDifferentFromPreviousUsedPasswords,
                fontSize: 12,
                color: AppColor.whiteColor.withOpacity(0.6)),
            SizedBox(
              height: 4.h,
            ),
            TextFormField(
              controller: _passwordController,
              style: TextStyle(color: AppColor.whiteColor),
              decoration: CustomWidget.customInputDecoration(
                hintText: S.of(context).newPassword,
                suffixIcon: CupertinoIcons.eye,
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
              height: 2.h,
            ),
            TextFormField(
              controller: _newPasswordController,
              style: TextStyle(color: AppColor.whiteColor),
              decoration: CustomWidget.customInputDecoration(
                hintText: S.of(context).confirmPassword,
                suffixIcon: CupertinoIcons.eye,
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
              height: 10.h,
            ),
            CustomWidget.customButton(
                callBack: () {
                  if (_newPasswordController.text == _passwordController.text) {
                    authController
                        .setNewPassword({"password": _passwordController.text});
                  } else {
                    CustomWidget.errorSnackBar(
                        content: S
                            .of(context)
                            .newPasswordAndConfirmPasswordShouldBeSame);
                  }
                },
                height: 6.h,
                width: 70.w,
                btnText: S.of(context).resetPassword,
                textColor: AppColor.whiteColor,
                color: AppColor.primaryColor),
          ],
        ),
      ),
    );
  }
}

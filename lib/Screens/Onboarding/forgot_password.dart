import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/Controllers/authentication_controller.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/Utils/custom_widget.dart';
import 'package:meditation_app/generated/assets.dart';
import 'package:meditation_app/generated/l10n.dart';
import 'package:sizer/sizer.dart';

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
            CustomWidget.customAppBar(title: S.of(context).forgotPassword),
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
                CustomWidget.text(S.of(context).didSomeoneForgetTheirPassword,
                    fontSize: 13,
                    color: AppColor.whiteColor,
                    fontWeight: FontWeight.bold),
                SizedBox(
                  height: 1.h,
                ),
                CustomWidget.text(S.of(context).thatsOk,
                    fontSize: 10, color: AppColor.whiteColor.withOpacity(0.8)),
                SizedBox(
                  height: 2.h,
                ),
                CustomWidget.text(S.of(context).forgotPasswordDescription,
                    fontSize: 10, color: AppColor.whiteColor.withOpacity(0.8)),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: TextFormField(
                    controller: _emailController,
                    style: const TextStyle(color: AppColor.whiteColor),
                    decoration: CustomWidget.customInputDecoration(
                        hintText: S.of(context).emailAddress),
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                CustomWidget.customButton(
                    callBack: () {
                      if (_emailController.text.isNotEmpty) {
                        authController
                            .forgotPassword({"email": _emailController.text});
                      } else {
                        CustomWidget.errorSnackBar(
                            content: S.of(context).enterEmail);
                      }
                    },
                    height: 6.h,
                    width: 70.w,
                    btnText: S.of(context).submit,
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

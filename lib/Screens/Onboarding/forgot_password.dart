import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/Utils/custom_widget.dart';
import 'package:meditation_app/generated/assets.dart';
import 'package:sizer/sizer.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 28.0, horizontal: 13),
            child: Row(
              children: [
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColor.whiteColor)),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Center(
                        child: Icon(
                      Icons.arrow_back_ios,
                      color: AppColor.whiteColor,
                    )),
                  ),
                ),
                SizedBox(
                  width: 22.w,
                ),
                CustomWidget.text("Forgot Password"),
              ],
            ),
          ),
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
                  style: const TextStyle(color: AppColor.whiteColor),
                  decoration: CustomWidget.customInputDecoration(
                      hintText: "Email Address"),
                ),
              ),
              SizedBox(
                height: 7.h,
              ),
              CustomWidget.customButton(
                  callBack: () {},
                  height: 6.h,
                  width: 70.w,
                  btnText: "Submit",
                  textColor: AppColor.whiteColor,
                  color: Color(0xffFFC700)),
            ],
          )
        ],
      ),
    );
  }
}

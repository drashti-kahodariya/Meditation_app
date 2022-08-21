import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/Controllers/authentication_controller.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/Utils/custom_widget.dart';
import 'package:meditation_app/generated/assets.dart';
import 'package:sizer/sizer.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var authController = Get.put(AuthenticationController());
  var _nameController = TextEditingController();
  var _emailController = TextEditingController();
  var _mobNoController = TextEditingController();
  @override
  void initState() {
    authController.currentUserData();
    // _nameController.text = authController.currentUserData.value.name!;
    _emailController.text = authController.currentUserData.value.email!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 28.0, horizontal: 13),
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
                    width: 12.w,
                  ),
                  CustomWidget.text("Account Information"),
                ],
              ),
            ),
            CircleAvatar(
              backgroundColor: AppColor.whiteColor.withOpacity(0.2),
              maxRadius: 70,
              child: Padding(
                padding: const EdgeInsets.all(38.0),
                child: Image.asset(
                  Assets.assetsEditUser,
                  color: AppColor.primaryColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: TextFormField(
                controller: _nameController,
                style: TextStyle(color: AppColor.whiteColor),
                decoration: CustomWidget.customInputDecoration(
                    hintText: "Name",
                    isFilled: true,
                    isPrefixShow: true,
                    prefixImage: Assets.assetsUser),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: TextFormField(
                controller: _emailController,
                style: TextStyle(color: AppColor.whiteColor),
                decoration: CustomWidget.customInputDecoration(
                    hintText: "Email",
                    isFilled: true,
                    isPrefixShow: true,
                    prefixImage: Assets.assetsEmailIcon),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28.0, right: 28, left: 28),
              child: TextFormField(
                controller: _mobNoController,
                style: TextStyle(color: AppColor.whiteColor),
                decoration: CustomWidget.customInputDecoration(
                  hintText: "Mobile No.",
                  isFilled: true,
                  isPrefixShow: true,
                  prefixImage: Assets.assetsPhone,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomWidget.customButton(
                callBack: () {},
                height: 6.h,
                width: 70.w,
                btnText: "Save",
                textColor: AppColor.whiteColor,
                color: Color(0xffFFC700)),
          ],
        ),
      ),
    );
  }
}

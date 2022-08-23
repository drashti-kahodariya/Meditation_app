import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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
  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobNoController = TextEditingController();
  XFile? selectedImage;
  RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  void initState() {
    if (mounted) {
      authController.currentUserData();
    }
    _fnameController.text = authController.currentUserData.value.name!;
    _lnameController.text = authController.currentUserData.value.name!;
    _mobNoController.text = authController.currentUserData.value.email!;
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
            GestureDetector(
              onTap: () async {
                print("Done");
                final ImagePicker _picker = ImagePicker();
                selectedImage = await _picker.pickImage(
                    source: ImageSource.gallery, imageQuality: 1);
                setState(() {});
              },
              child: selectedImage == null &&
                      authController.currentUserData.value.image == null
                  ? Center(
                      child: CircleAvatar(
                        backgroundColor: AppColor.whiteColor.withOpacity(0.2),
                        maxRadius: 60,
                        child: Padding(
                          padding: const EdgeInsets.all(33.0),
                          child: Image.asset(
                            Assets.assetsEditUser,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ),
                    )
                  : selectedImage == null
                      ? Center(
                          child: CircleAvatar(
                            maxRadius: 60,
                            backgroundImage: NetworkImage(
                                authController.currentUserData.value.image!),
                          ),
                        )
                      : Center(
                          child: CircleAvatar(
                            maxRadius: 60,
                            backgroundImage:
                                FileImage(File(selectedImage!.path)),
                          ),
                        ),
              // CircleAvatar(
              //   backgroundColor: AppColor.whiteColor.withOpacity(0.2),
              //   maxRadius: 70,
              //   child: Padding(
              //     padding: const EdgeInsets.all(38.0),
              //     child: Image.asset(
              //       Assets.assetsEditUser,
              //       color: AppColor.primaryColor,
              //     ),
              //   ),
              // ),
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _fnameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter first name';
                      }
                    },
                    style: TextStyle(color: AppColor.whiteColor),
                    decoration: CustomWidget.customInputDecoration(
                        hintText: "First Name",
                        isFilled: true,
                        isPrefixShow: true,
                        prefixImage: Assets.assetsUser),
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  TextFormField(
                    controller: _lnameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter last name';
                      }
                    },
                    style: TextStyle(color: AppColor.whiteColor),
                    decoration: CustomWidget.customInputDecoration(
                        hintText: "Last Name",
                        isFilled: true,
                        isPrefixShow: true,
                        prefixImage: Assets.assetsUser),
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter email';
                      } else {
                        if (!emailRegex.hasMatch(value)) {
                          return 'Enter valid email';
                        } else {
                          return null;
                        }
                      }
                    },
                    style: TextStyle(color: AppColor.whiteColor),
                    decoration: CustomWidget.customInputDecoration(
                        hintText: "Email",
                        isFilled: true,
                        isPrefixShow: true,
                        prefixImage: Assets.assetsEmailIcon),
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  TextFormField(
                    controller: _mobNoController,
                    style: TextStyle(color: AppColor.whiteColor),
                    decoration: CustomWidget.customInputDecoration(
                      hintText: "Mobile No.",
                      isFilled: true,
                      isPrefixShow: true,
                      prefixImage: Assets.assetsPhone,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            CustomWidget.customButton(
                callBack: () {
                  if (selectedImage != null) {
                    authController.editImage(
                        _fnameController.text,
                        _lnameController.text,
                        _mobNoController.text,
                        _emailController.text,
                        filePath: selectedImage!.path);
                  } else {
                    authController.editImage(
                        _fnameController.text,
                        _lnameController.text,
                        _mobNoController.text,
                        _emailController.text);
                  }
                },
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

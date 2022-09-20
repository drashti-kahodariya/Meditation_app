import 'package:flutter/material.dart';

class AppColor {
  static const primaryColor = Color(0xffAF6FBA);
  static const backgroundColor = Color(0xff51427c);
  static const yellowColor = Color(0xffFFCC00);
  static const whiteColor = Color(0xFFFFFFFF);
  static const lightPinkColor = Color(0xFFFD8E8E);
  static const subtitleColor = Color(0xffFBD89F);
  static const blackColor = Color(0xFF000000);
  static const textPrimaryColor = Color(0xFF121515);
  static const textHeadingColor = Color(0xff5D5D5D);
  static const textFieldColor = Color(0xff262837);
}

/// This class is used for difine the static keys for local storage, you can access the value with this key
///
class AppPreferencesHelper {
  static const String pUser = "User";
  static const String recent = "Recent";
  static const String downloads = "Downloads";
  static const String language = "Language";
}

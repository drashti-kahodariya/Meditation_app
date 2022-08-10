import 'package:flutter/material.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/generated/assets.dart';
import 'package:sizer/sizer.dart';

class MusicPlayScreen extends StatefulWidget {
  const MusicPlayScreen({Key? key}) : super(key: key);

  @override
  _MusicPlayScreenState createState() => _MusicPlayScreenState();
}

class _MusicPlayScreenState extends State<MusicPlayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Stack(
        children: [
          Image.asset(
            Assets.assetsDummy3,
            height: 100.h,
            width: 100.w,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

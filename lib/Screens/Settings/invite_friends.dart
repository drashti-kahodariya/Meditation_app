import 'package:flutter/material.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/Utils/custom_widget.dart';
import 'package:meditation_app/generated/assets.dart';
import 'package:sizer/sizer.dart';

class InviteFriends extends StatefulWidget {
  const InviteFriends({Key? key}) : super(key: key);

  @override
  _InviteFriendsState createState() => _InviteFriendsState();
}

class _InviteFriendsState extends State<InviteFriends> {
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
                CustomWidget.text("Invite your friends"),
              ],
            ),
          ),
          Column(
            children: [
              CustomWidget.customAssetImageWidget(
                image: Assets.assetsInvitationImage,
                height: 3.h,
                width: 50.w,
              ),
              SizedBox(
                height: 7.h,
              ),
              CustomWidget.text(
                  "You’ve used all you invites. More to come at the appropriate time.",
                  fontSize: 10,
                  color: AppColor.whiteColor.withOpacity(0.8)),
              SizedBox(
                height: 10.h,
              ),
              CustomWidget.customButton(
                  callBack: () {},
                  height: 6.h,
                  width: 70.w,
                  btnText: "Send Invite",
                  textColor: AppColor.whiteColor,
                  color: Color(0xffFFC700)),
            ],
          )
        ],
      ),
    );
  }
}

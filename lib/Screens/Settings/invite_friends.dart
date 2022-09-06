import 'package:flutter/material.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/Utils/custom_widget.dart';
import 'package:meditation_app/generated/assets.dart';
import 'package:meditation_app/generated/l10n.dart';
import 'package:share_plus/share_plus.dart';
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
          CustomWidget.customAppBar(title: S.of(context).inviteFriend),
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
                  S
                      .of(context)
                      .youHaveUsedAllYouInvitesMoreToComeAtTheAppropriateTime,
                  fontSize: 10,
                  color: AppColor.whiteColor.withOpacity(0.8)),
              SizedBox(
                height: 10.h,
              ),
              CustomWidget.customButton(
                  callBack: () {
                    Share.share('check out my website https://example.com');
                  },
                  height: 6.h,
                  width: 70.w,
                  btnText: S.of(context).sendInvite,
                  textColor: AppColor.whiteColor,
                  color: Color(0xffFFC700)),
            ],
          )
        ],
      ),
    );
  }
}

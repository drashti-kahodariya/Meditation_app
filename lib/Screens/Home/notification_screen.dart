import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/Utils/custom_widget.dart';
import 'package:meditation_app/generated/assets.dart';
import 'package:meditation_app/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColor.backgroundColor,
        body: Column(
          children: [
            CustomWidget.customAppBar(title: S.of(context).notification),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomWidget.text("Yesterday"),
                        Container(
                          height: 50.h,
                          width: 100.w,
                          decoration: CustomWidget.customBoxDecoration(
                            borderRadius: 10,
                            color: AppColor.whiteColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                Assets.assetsDummy2,
                                height: 35.h,
                                width: 100.w,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: CustomWidget.text("Recommended for you",
                                    color: AppColor.blackColor.withOpacity(0.4),
                                    fontSize: 10),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomWidget.text(
                                        "What are you grateful for?",
                                        color: AppColor.blackColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: AppColor.blackColor,
                                      size: 15,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: CustomWidget.text(
                                    "Practicing gratitude can help us appreciate the present, but also feel happier and more positive overall.Ready to try it?",
                                    color: AppColor.blackColor.withOpacity(0.4),
                                    maxLine: 3,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 10),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 2.h,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

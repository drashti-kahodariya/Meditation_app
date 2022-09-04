import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/Controllers/home_controller.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/Utils/custom_widget.dart';
import 'package:meditation_app/generated/assets.dart';
import 'package:sizer/sizer.dart';

class RecentScreen extends StatefulWidget {
  const RecentScreen({Key? key}) : super(key: key);

  @override
  _RecentScreenState createState() => _RecentScreenState();
}

class _RecentScreenState extends State<RecentScreen> {
  var homeController = HomeController();
  @override
  void initState() {
    print(homeController.recentList.value.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Column(
        children: [
          CustomWidget.customAppBar(title: "Recent"),
          Expanded(
            child: Obx(() {
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: homeController.recentList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                      children: [
                        Container(
                          height: 16.h,
                          width: 100.w,
                          decoration: CustomWidget.customBoxDecoration(
                            borderRadius: 10,
                            color: AppColor.primaryColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 14.h,
                                  width: 28.w,
                                  decoration: CustomWidget.customBoxDecoration(
                                      borderRadius: 12,
                                      borderColor: Colors.white),
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomWidget.text(
                                        homeController.recentList[index].title!,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                    Row(
                                      children: [
                                        CustomWidget.customAssetImageWidget(
                                            image: Assets.assetsVolumeUp,
                                            height: 2),
                                        CustomWidget.text("Course",
                                            textAlign: TextAlign.start,
                                            fontSize: 10,
                                            maxLine: 1,
                                            overflow: TextOverflow.ellipsis,
                                            color: AppColor.whiteColor),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        CustomWidget.customAssetImageWidget(
                                            image: Assets.assetsClock,
                                            height: 2),
                                        CustomWidget.text(
                                          "1 - 2 Min",
                                          textAlign: TextAlign.start,
                                          fontSize: 10,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Spacer(),
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColor.whiteColor,
                                  ),
                                  child: Icon(
                                    Icons.play_arrow,
                                    color: AppColor.backgroundColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 2.h,
                  );
                },
              );
            }),
          )
        ],
      ),
    );
  }
}

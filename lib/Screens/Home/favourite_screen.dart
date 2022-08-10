import 'package:flutter/material.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/Utils/custom_widget.dart';
import 'package:meditation_app/generated/assets.dart';
import 'package:sizer/sizer.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
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
                CustomWidget.text("Favorite"),
              ],
            ),
          ),
          Container(
            height: 12.h,
            width: 100.w,
            color: AppColor.primaryColor,
            child: Center(
              child: CustomWidget.text(
                  "Find all your favorites meditation and exercirs here."),
            ),
          ),
          Expanded(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 9.h,
                              width: 25.w,
                              decoration: CustomWidget.customBoxDecoration(
                                  borderRadius: 12,
                                  borderColor: AppColor.whiteColor),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomWidget.text("Mental training",
                                    fontSize: 15),
                                CustomWidget.text("3 min 43 sec",
                                    fontSize: 11,
                                    color:
                                        AppColor.whiteColor.withOpacity(0.7)),
                              ],
                            ),
                            Spacer(),
                            CustomWidget.customAssetImageWidget(
                                image: Assets.assetsHeart)
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        const Divider(
                          color: AppColor.blackColor,
                          thickness: 0.2,
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

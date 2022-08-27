import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/Controllers/explore_controller.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/Utils/custom_widget.dart';
import 'package:meditation_app/generated/assets.dart';
import 'package:sizer/sizer.dart';

class FeaturedScreen extends StatefulWidget {
  const FeaturedScreen({Key? key}) : super(key: key);

  @override
  _FeaturedScreenState createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {
  var exploreController = ExploreController();
  RxString id = "".obs;

  @override
  void didChangeDependencies() {
    id.value = Get.arguments;
    exploreController
        .getFeaturedData({"categoryId": id.value, "page": "1", "limit": "10"});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.backgroundColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  Assets.assetsDummy4,
                  height: 40.h,
                  width: 100.w,
                  fit: BoxFit.cover,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 28.0, horizontal: 13),
                    child: Container(
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
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    height: 25,
                    width: 85,
                    decoration: CustomWidget.customBoxDecoration(
                        borderRadius: 10,
                        borderColor: AppColor.whiteColor.withOpacity(0.6)),
                    child: CustomWidget.text("Featured",
                        fontSize: 10,
                        color: AppColor.whiteColor.withOpacity(0.6)),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomWidget.text("Night Island", fontSize: 20),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomWidget.text(
                      "Ease the mind into a restful night’s sleep with these deep, amblent tones.",
                      fontSize: 10,
                      textAlign: TextAlign.start,
                      color: AppColor.whiteColor.withOpacity(0.8)),
                  SizedBox(
                    height: 1.h,
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Container(
                height: 22.h,
                width: 100.w,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 22.h,
                      width: 47.w,
                      // color: AppColor.blackColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              Assets.assetsDummy5,
                              height: 15.h,
                              width: 100.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child:
                                CustomWidget.text("Moon Clouds", fontSize: 15),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                CustomWidget.text("45 min",
                                    fontSize: 10,
                                    color:
                                        AppColor.whiteColor.withOpacity(0.8)),
                                SizedBox(
                                  width: 1.w,
                                ),
                                CustomWidget.customAssetImageWidget(
                                    image: Assets.assetsVolumeUp, height: 2.5),
                                CustomWidget.text("Sleep music",
                                    fontSize: 10,
                                    color:
                                        AppColor.whiteColor.withOpacity(0.8)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 3.w,
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: CustomWidget.text(
                "Explore Sleep ",
                fontSize: 20,
                color: AppColor.whiteColor,
              ),
            ),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Stack(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          Assets.assetsFocusImage,
                          height: 30.h,
                          width: 100.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Column(
                          children: [
                            CustomWidget.text("Guided Breath", fontSize: 22),
                            CustomWidget.text("The power of deep calm",
                                fontSize: 13,
                                color: AppColor.whiteColor.withOpacity(0.8)),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 3.h,
                );
              },
            ),
            SizedBox(
              height: 28,
            )
          ],
        ),
      ),
    );
  }
}

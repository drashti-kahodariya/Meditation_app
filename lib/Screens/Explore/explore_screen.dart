import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/Controllers/explore_controller.dart';
import 'package:meditation_app/Routes/routes.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/Utils/custom_widget.dart';
import 'package:meditation_app/generated/assets.dart';
import 'package:sizer/sizer.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final exploreController = ExploreController();
  var iconList = [
    Assets.assetsMeditateIcon,
    Assets.assetsSleepIcon,
    Assets.assetsFocusIcon
  ];
  var imageList = [
    Assets.assetsMeditateImage,
    Assets.assetsSleepImage,
    Assets.assetsFocusImage
  ];

  @override
  void initState() {
    exploreController.getExploreData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            SizedBox(
              height: 6.h,
            ),
            Expanded(
              child: Obx(() {
                return ListView.separated(
                  itemCount: exploreController.exploreList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.featuredScreen,
                            arguments: exploreController.exploreList[index].sId);
                      },
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              imageList[index],
                              fit: BoxFit.contain,
                              // height: 25.h,
                              // width: 150.w,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  iconList[index],
                                  height: 30,
                                  width: 30,
                                ),
                                CustomWidget.text(
                                    exploreController.exploreList[index].name!)
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 2.5.h,
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

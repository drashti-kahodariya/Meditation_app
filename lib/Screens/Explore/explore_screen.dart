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
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 35.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            () => Column(
              children: exploreController.exploreList.map((element) {
                var index = exploreController.exploreList.indexOf(element);
                return Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.featuredScreen,
                                arguments:
                                    exploreController.exploreList[index].sId);
                          },
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  imageList[index],
                                  fit: BoxFit.cover,
                                  // height: 25.h,
                                  width: 100.w,
                                ),
                              ),
                              Container(
                                // height: 100.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  color: AppColor.blackColor.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 10,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      iconList[index],
                                      height: 25,
                                      width: 25,
                                    ),
                                    CustomWidget.text(
                                        exploreController
                                            .exploreList[index].name!
                                            .toUpperCase(),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: AppColor.whiteColor
                                            .withOpacity(0.9))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

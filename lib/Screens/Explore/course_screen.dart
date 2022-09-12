import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/Controllers/home_controller.dart';
import 'package:meditation_app/Data/Model/explore_course_model.dart';
import 'package:meditation_app/Routes/routes.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/Utils/custom_widget.dart';
import 'package:meditation_app/generated/assets.dart';
import 'package:sizer/sizer.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  var courseData = <CourseData>[];
  var homeController = Get.put(HomeController());
  @override
  void initState() {
    courseData = Get.arguments;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Column(
        children: [
          CustomWidget.customAppBar(title: "Course"),
          Expanded(
            child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              itemCount: courseData.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.episodeScreen,
                        arguments: courseData[index].sId);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Stack(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: CachedNetworkImage(
                            imageUrl: courseData[index].image!,
                            fit: BoxFit.cover,
                            height: 30.h,
                            width: 100.w,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    const CupertinoActivityIndicator(
                                        color: Colors.white),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        Container(
                          height: 30.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              color: AppColor.blackColor.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(25)),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 75.w,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomWidget.text(
                                          courseData[index].title!.capitalize!,
                                          fontSize: 20,
                                          maxLine: 2,
                                          fontWeight: FontWeight.w600),
                                      CustomWidget.text(
                                          courseData[index]
                                              .description!
                                              .capitalize!,
                                          fontSize: 12,
                                          color: AppColor.whiteColor
                                              .withOpacity(0.7)),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await homeController.addFavoriteList(
                                        {"courseId": courseData[index].sId!});
                                    // homeController.getFavoriteList();
                                  },
                                  child: courseData[index].isFavorite!
                                      ? CustomWidget.customAssetImageWidget(
                                          image: Assets.assetsHeart)
                                      : CustomWidget.customAssetImageWidget(
                                          image: Assets.assetsHeartOutline),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 3.h,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

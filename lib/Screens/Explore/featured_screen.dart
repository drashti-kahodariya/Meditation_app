import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:meditation_app/Controllers/explore_controller.dart';
import 'package:meditation_app/Controllers/home_controller.dart';
import 'package:meditation_app/Routes/routes.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/Utils/custom_widget.dart';
import 'package:meditation_app/generated/assets.dart';
import 'package:sizer/sizer.dart';

class FeaturedScreen extends StatefulWidget {
  const FeaturedScreen(
      {Key? key, required this.id, required this.image, required this.name})
      : super(key: key);
  final String id;
  final String image;
  final String name;

  @override
  _FeaturedScreenState createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {
  var exploreController = Get.put(ExploreController());
  var homeController = Get.put(HomeController());
  RxInt page = 1.obs;

  @override
  void didChangeDependencies() {
    exploreController.getFeaturedData(
        {"categoryId": widget.id, "page": page.value, "limit": 10});
    exploreController.getExploreCourseData(widget.id);

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
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    widget.image,
                    height: 40.h,
                    width: 100.w,
                    fit: BoxFit.cover,
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
                  CustomWidget.text(widget.name, fontSize: 20),
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
                child: LazyLoadScrollView(
                  onEndOfPage: () {
                    page.value += 1;
                    exploreController.getFeaturedData({
                      "categoryId": widget.id,
                      "page": page.value,
                      "limit": 10
                    });
                  },
                  child: Obx(() {
                    return ListView.separated(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: exploreController.featuredCourseList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.episodeScreen,
                                arguments: exploreController
                                    .featuredCourseList[index].sId);
                          },
                          child: Container(
                            height: 22.h,
                            width: 47.w,
                            // color: AppColor.blackColor,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: CachedNetworkImage(
                                          imageUrl: exploreController
                                              .featuredCourseList[index].image!,
                                          fit: BoxFit.cover,
                                          height: 15.h,
                                          width: 100.w,
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                              const CupertinoActivityIndicator(
                                                  color: Colors.white),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () async {
                                          await homeController.addFavoriteList({
                                            "courseId": exploreController
                                                .featuredCourseList[index].sId!
                                          });
                                          exploreController.getFeaturedData({
                                            "categoryId": widget.id,
                                            "page": page.value,
                                            "limit": 10
                                          });
                                        },
                                        child: exploreController
                                                .featuredCourseList[index]
                                                .isFavorite!
                                            ? CustomWidget
                                                .customAssetImageWidget(
                                                    image: Assets.assetsHeart)
                                            : CustomWidget
                                                .customAssetImageWidget(
                                                    image: Assets
                                                        .assetsHeartOutline),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: CustomWidget.text(
                                      exploreController
                                          .featuredCourseList[index].title!,
                                      fontSize: 15),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Row(
                                    children: [
                                      CustomWidget.customAssetImageWidget(
                                          image: Assets.assetsVolumeUp,
                                          height: 2.5),
                                      CustomWidget.text(
                                          exploreController
                                              .featuredCourseList[index]
                                              .description!,
                                          fontSize: 10,
                                          color: AppColor.whiteColor
                                              .withOpacity(0.8)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 3.w,
                        );
                      },
                    );
                  }),
                ),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: CustomWidget.text(
                "Explore ${widget.name}",
                fontSize: 20,
                color: AppColor.whiteColor,
              ),
            ),
            Obx(() {
              return ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                itemCount: exploreController.exploreCourseList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.courseScreen,
                          arguments: exploreController
                              .exploreCourseList[index].courseList!);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Stack(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: CachedNetworkImage(
                              imageUrl: exploreController
                                  .exploreCourseList[index].image!,
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomWidget.text(
                                      exploreController.exploreCourseList[index]
                                          .title!.capitalize!,
                                      fontSize: 20,
                                      maxLine: 2,
                                      fontWeight: FontWeight.w600),
                                  CustomWidget.text(
                                      exploreController.exploreCourseList[index]
                                          .description!.capitalize!,
                                      fontSize: 12,
                                      color:
                                          AppColor.whiteColor.withOpacity(0.7)),
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
              );
            }),
            SizedBox(
              height: 28,
            )
          ],
        ),
      ),
    );
  }
}

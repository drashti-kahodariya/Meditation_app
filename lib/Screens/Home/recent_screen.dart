import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/Controllers/home_controller.dart';
import 'package:meditation_app/Routes/routes.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/Utils/custom_widget.dart';
import 'package:meditation_app/generated/assets.dart';
import 'package:meditation_app/generated/l10n.dart';
import 'package:path/path.dart' as p;
import 'package:sizer/sizer.dart';

class RecentScreen extends StatefulWidget {
  const RecentScreen({Key? key}) : super(key: key);

  @override
  _RecentScreenState createState() => _RecentScreenState();
}

class _RecentScreenState extends State<RecentScreen> {
  var homeController = Get.put(HomeController());
  @override
  void initState() {
    print(homeController.recentList.length);
    homeController.getAndSetRecent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Column(
          children: [
            CustomWidget.customAppBar(title: S.of(context).recent),
            Expanded(
              child: Obx(
                () => ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: homeController.recentList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        final extension = p.extension(
                            homeController.recentList[index].audioOrVideo!);
                        if (extension == ".mp3") {
                          Get.toNamed(Routes.musicPlayScreen,
                              arguments: homeController.recentList[index]);
                        } else {
                          Get.toNamed(Routes.videoPlayScreen,
                              arguments: homeController.recentList[index]);
                        }
                      },
                      child: Padding(
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
                                      decoration:
                                          CustomWidget.customBoxDecoration(
                                              borderRadius: 12),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: CachedNetworkImage(
                                          imageUrl: homeController
                                              .recentList[index].image!,
                                          fit: BoxFit.cover,
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                              const CupertinoActivityIndicator(
                                                  color: Colors.white),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: CustomWidget.text(
                                                homeController
                                                    .recentList[index].title!,
                                                fontSize: 15,
                                                maxLine: 2,
                                                textAlign: TextAlign.start,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Row(
                                            children: [
                                              CustomWidget
                                                  .customAssetImageWidget(
                                                      image:
                                                          Assets.assetsVolumeUp,
                                                      height: 2),
                                              CustomWidget.text(
                                                  homeController
                                                      .recentList[index]
                                                      .description!,
                                                  textAlign: TextAlign.start,
                                                  fontSize: 10,
                                                  maxLine: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color: AppColor.whiteColor),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              CustomWidget
                                                  .customAssetImageWidget(
                                                      image: Assets.assetsClock,
                                                      height: 2),
                                              CustomWidget.text(
                                                homeController
                                                    .recentList[index].duration
                                                    .toString(),
                                                textAlign: TextAlign.start,
                                                fontSize: 10,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    // Spacer(),
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
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 2.h,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

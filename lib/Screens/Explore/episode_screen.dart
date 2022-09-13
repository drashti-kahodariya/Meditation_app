import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/Controllers/explore_controller.dart';
import 'package:meditation_app/Controllers/home_controller.dart';
import 'package:meditation_app/Routes/routes.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/Utils/custom_widget.dart';
import 'package:sizer/sizer.dart';

class EpisodeScreen extends StatefulWidget {
  const EpisodeScreen({Key? key}) : super(key: key);

  @override
  State<EpisodeScreen> createState() => _EpisodeScreenState();
}

class _EpisodeScreenState extends State<EpisodeScreen> {
  RxString id = "".obs;
  var exploreController = ExploreController();
  HomeController homeController = Get.find();
  @override
  void didChangeDependencies() {
    id.value = Get.arguments;
    print("id:::${id.value}");
    exploreController.getEpisodeData(id.value);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Column(
        children: [
          CustomWidget.customAppBar(title: "Episode"),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: exploreController.episodeList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        homeController.addInRecent(exploreController.episodeList[index]);
                        Get.toNamed(Routes.musicPlayScreen,
                          arguments: exploreController.episodeList[index]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    imageUrl: exploreController
                                        .episodeList[index].image!,
                                    fit: BoxFit.cover,
                                    height: 9.h,
                                    width: 25.w,
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            const CupertinoActivityIndicator(
                                                color: Colors.white),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 60.w,
                                      child: CustomWidget.text(
                                          exploreController
                                              .episodeList[index].title!,
                                          maxLine: 1,
                                          fontSize: 15,
                                          textAlign: TextAlign.start),
                                    ),
                                    CustomWidget.text(
                                        exploreController
                                            .episodeList[index].description!,
                                        fontSize: 11,
                                        color: AppColor.whiteColor
                                            .withOpacity(0.7)),
                                  ],
                                ),
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
                      ),
                    );
                  });
            }),
          )
        ],
      ),
    );
  }
}

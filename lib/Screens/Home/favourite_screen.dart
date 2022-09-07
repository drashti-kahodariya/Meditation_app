import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/Controllers/home_controller.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/Utils/custom_widget.dart';
import 'package:meditation_app/generated/assets.dart';
import 'package:meditation_app/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  var homeController = HomeController();
  @override
  void initState() {
    homeController.getFavoriteList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Column(
          children: [
            CustomWidget.customAppBar(title: S.of(context).favorite),
            Container(
              height: 12.h,
              width: 100.w,
              color: AppColor.primaryColor,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomWidget.text(S
                      .of(context)
                      .findAllYourFavoritesMeditationAndExerciesHere),
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: homeController.favouriteList.length,
                    itemBuilder: (context, index) {
                      var favouriteData = homeController.favouriteList[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 9.h,
                                  width: 25.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: CachedNetworkImage(
                                      imageUrl: favouriteData.course!.image!,
                                      fit: BoxFit.cover,
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) =>
                                              CupertinoActivityIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomWidget.text(
                                        favouriteData.course!.title!,
                                        fontSize: 15),
                                    CustomWidget.text("3 min 43 sec",
                                        fontSize: 11,
                                        color: AppColor.whiteColor
                                            .withOpacity(0.7)),
                                  ],
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () async {
                                    await homeController.addFavoriteList({
                                      "courseId": favouriteData.course!.sId!
                                    });
                                    homeController.getFavoriteList();
                                  },
                                  child: CustomWidget.customAssetImageWidget(
                                      image: Assets.assetsHeart),
                                )
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
                    });
              }),
            )
          ],
        ),
      ),
    );
  }
}

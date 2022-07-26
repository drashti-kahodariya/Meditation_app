import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/Controllers/home_controller.dart';
import 'package:meditation_app/Routes/routes.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/Utils/custom_widget.dart';
import 'package:meditation_app/generated/l10n.dart';
import 'package:path/path.dart' as p;
import 'package:sizer/sizer.dart';

class DownloadsScreen extends StatefulWidget {
  const DownloadsScreen({Key? key}) : super(key: key);

  @override
  _DownloadsScreenState createState() => _DownloadsScreenState();
}

class _DownloadsScreenState extends State<DownloadsScreen> {
  var homeController = Get.put(HomeController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeController.getAndSetDownloads();
    });
    super.initState();
  }

  // Future openFile({required String url, required String fileName}) async {
  //   final name = fileName ?? url.split('/').last;
  //   final file = await downloadFile(url, name);
  //   print("Path::${file!.path}");
  //   OpenFile.open(file!.path);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Column(
        children: [
          CustomWidget.customAppBar(title: S.of(context).downloads),
          Obx(() {
            return Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: homeController.downloadList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        final extension = p.extension(
                            homeController.downloadList[index].audioOrVideo!);

                        if (extension == ".mp3") {
                          Get.toNamed(Routes.musicPlayScreen,
                              arguments: homeController.downloadList[index]);
                        } else {
                          Get.toNamed(Routes.videoPlayScreen,
                              arguments: homeController.downloadList[index]);
                        }
                      },
                      child: Padding(
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
                                      imageUrl: homeController
                                          .downloadList[index].image!,
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
                                Container(
                                  width: 60.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomWidget.text(
                                          homeController
                                              .downloadList[index].title!,
                                          fontSize: 15,
                                          maxLine: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left),
                                      CustomWidget.text(
                                          homeController
                                              .downloadList[index].description!,
                                          fontSize: 11,
                                          color: AppColor.whiteColor
                                              .withOpacity(0.7)),
                                    ],
                                  ),
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
                  }),
            );
          })
        ],
      ),
    );
  }
}

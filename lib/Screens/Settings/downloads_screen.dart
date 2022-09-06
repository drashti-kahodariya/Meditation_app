import 'dart:typed_data';

import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/Utils/custom_widget.dart';
import 'package:meditation_app/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class DownloadsScreen extends StatefulWidget {
  const DownloadsScreen({Key? key}) : super(key: key);

  @override
  _DownloadsScreenState createState() => _DownloadsScreenState();
}

class _DownloadsScreenState extends State<DownloadsScreen> {
  @override
  void initState() {
    downloads();
    super.initState();
  }

  downloads() async {
    Uint8List bytes = (await NetworkAssetBundle(Uri.parse(
                "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3"))
            .load(
                "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3"))
        .buffer
        .asUint8List();
    await FileSaver.instance.saveAs("download", bytes, 'mp3', MimeType.MP3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Column(
        children: [
          CustomWidget.customAppBar(title: S.of(context).downloads),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    // openFile(
    //     url:
    //         "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
    //     fileName: "video.mp4");
    super.initState();
  }

  // Future openFile({required String url, required String fileName}) async {
  //   final name = fileName ?? url.split('/').last;
  //   final file = await downloadFile(url, name);
  //   print("Path::${file!.path}");
  //   OpenFile.open(file!.path);
  // }

  // Future<File>? downloadFile(String url, String name) async {
  //   final appStorage = await getApplicationDocumentsDirectory();
  //   final file = File("${appStorage.path}/${name}");
  //
  //   final response = await Dio().get(
  //     url,
  //     options: Options(
  //         responseType: ResponseType.bytes,
  //         followRedirects: false,
  //         validateStatus: (status) {
  //           return status! < 500;
  //         }),
  //   );
  //   final raf = file.openSync(mode: FileMode.write);
  //   // response.data is List<int> type
  //   raf.writeFromSync(response.data);
  //   await raf.close();
  //   return file;
  // }

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

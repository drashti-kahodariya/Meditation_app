import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/Data/Model/episode_model.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

class VideoPlayScreen extends StatefulWidget {
  const VideoPlayScreen({
    Key? key,
  }) : super(key: key);

  @override
  _VideoPlayScreenState createState() => _VideoPlayScreenState();
}

class _VideoPlayScreenState extends State<VideoPlayScreen> {
  String? videoId;
  var videoDetails = EpisodeData().obs;
  VideoPlayerController? _controller;

  @override
  void initState() {
    videoDetails.value = Get.arguments;
    _controller =
        VideoPlayerController.network(videoDetails.value.audioOrVideo!)
          ..initialize().then((_) {
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {});
          });
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColor.whiteColor)),
                  child: Center(
                      child: Icon(
                        Icons.close,
                        color: AppColor.whiteColor,
                      )),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Center(
                child: _controller!.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller!.value.aspectRatio,
                        child: VideoPlayer(_controller!),
                      )
                    : Container(),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.primaryColor,
            onPressed: () {
              setState(() {
                _controller!.value.isPlaying
                    ? _controller!.pause()
                    : _controller!.play();
              });
            },
            child: Icon(
              _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
            ),
          ),
        ),
      );
    });
  }
}

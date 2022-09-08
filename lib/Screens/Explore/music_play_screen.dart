import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meditation_app/Data/Model/episode_model.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/Utils/custom_widget.dart';
import 'package:meditation_app/generated/assets.dart';
import 'package:rxdart/rxdart.dart' as rx;
import 'package:sizer/sizer.dart';

class MusicPlayScreen extends StatefulWidget {
  const MusicPlayScreen({Key? key}) : super(key: key);

  @override
  _MusicPlayScreenState createState() => _MusicPlayScreenState();
}

class _MusicPlayScreenState extends State<MusicPlayScreen>
    with WidgetsBindingObserver {
  var audioData = EpisodeData().obs;
  RxBool isPlay = true.obs;
  Duration? progress;
  Duration? buffered;
  AudioPlayer? _player;
  Stream<DurationState>? _durationState;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    audioData.value = Get.arguments;
    _player = AudioPlayer();
    _durationState =
        rx.Rx.combineLatest2<Duration, PlaybackEvent, DurationState>(
            _player!.positionStream,
            _player!.playbackEventStream,
            (position, playbackEvent) => DurationState(
                  progress: position,
                  buffered: playbackEvent.bufferedPosition,
                  total: playbackEvent.duration,
                ));
    _init();
    super.initState();
  }

  Future<void> _init() async {
    try {
      await _player!.setUrl(audioData.value.audioOrVideo!);
      _player!.play();
    } catch (e) {
      print("An error occured $e");
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _player!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.black26,
        body: Stack(
          children: [
            Container(
              height: 100.h,
              width: 100.w,
              child: CachedNetworkImage(
                maxHeightDiskCache: 1000,
                imageUrl: audioData.value.image!,
                placeholder: (_, String s) => CupertinoActivityIndicator(),
                errorWidget: (_, __, ___) => CupertinoActivityIndicator(),
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 100.h,
              width: 100.w,
              decoration:
                  BoxDecoration(color: AppColor.blackColor.withOpacity(0.4)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0, right: 18, left: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: AppColor.whiteColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomWidget.text("${audioData.value.title}",
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.white),
                  CustomWidget.text("${audioData.value.description}",
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: AppColor.whiteColor.withOpacity(0.8)),
                  // const Spacer(),
                  SizedBox(height: 20.h),
                  StreamBuilder<PlayerState>(
                    stream: _player!.playerStateStream,
                    builder: (context, snapshot) {
                      final playerState = snapshot.data;
                      final processingState = playerState?.processingState;
                      final playing = playerState?.playing;
                      if (processingState == ProcessingState.loading ||
                          processingState == ProcessingState.buffering) {
                        return Container(
                          margin: const EdgeInsets.all(8.0),
                          height: 9.0.h,
                          width: 9.0.h,
                          child: const CupertinoActivityIndicator(),
                        );
                      } else if (playing != true) {
                        return GestureDetector(
                            onTap: _player!.play,
                            child: CustomWidget.customAssetImageWidget(
                              height: 8.0,
                              width: 8.0,
                              image: Assets.assetsPlay,
                            ));
                      } else if (processingState != ProcessingState.completed) {
                        return GestureDetector(
                            onTap: _player!.pause,
                            child: CustomWidget.customAssetImageWidget(
                                height: 8.0,
                                width: 8.0,
                                image: Assets.assetsPause,
                                color: AppColor.whiteColor));
                      } else {
                        return IconButton(
                          icon: const Icon(
                            Icons.replay,
                            color: AppColor.whiteColor,
                          ),
                          iconSize: 64.0,
                          onPressed: () => _player!.seek(Duration.zero),
                        );
                      }
                    },
                  ),
                  Spacer(),
                  StreamBuilder<DurationState>(
                    stream: _durationState,
                    builder: (context, snapshot) {
                      final durationState = snapshot.data;

                      progress = durationState?.progress ?? Duration.zero;
                      buffered = durationState?.buffered ?? Duration.zero;
                      final total = durationState?.total ?? Duration.zero;
                      return Theme(
                        data: ThemeData.dark(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: ProgressBar(
                            progress: progress!,
                            buffered: buffered,
                            barHeight: 3,
                            thumbRadius: 6,
                            progressBarColor: Colors.white.withOpacity(1),
                            baseBarColor: Colors.white.withOpacity(0.1),
                            bufferedBarColor: Colors.white.withOpacity(0.4),
                            thumbColor: Colors.white,
                            total: total,
                            onSeek: (duration) {
                              _player!.seek(duration);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   backgroundColor: AppColor.backgroundColor,
    //   body: Stack(
    //     children: [
    //       Image.asset(
    //         Assets.assetsDummy3,
    //         height: 100.h,
    //         width: 100.w,
    //         fit: BoxFit.cover,
    //       ),
    //     ],
    //   ),
    // );
  }
}

class DurationState {
  const DurationState({this.progress, this.buffered, this.total});

  final Duration? progress;
  final Duration? buffered;
  final Duration? total;
}

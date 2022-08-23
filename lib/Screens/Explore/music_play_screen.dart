import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meditation_app/Data/Model/dashboard_meditation_model.dart';
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
  var audioData = StartYourDay().obs;
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
    return Scaffold(
      // backgroundColor: Colors.black26,
      body: Stack(
        children: [
          Container(
            height: 100.h,
            width: 100.w,
            child: Image.network(
              audioData.value.image!,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 38.0, right: 18, left: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  height: 65.h,
                ),
                CustomWidget.text("${audioData.value.title}",
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.black),
                CustomWidget.text("${audioData.value.description}",
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: const Color(0xff5b6667)),
                // const Spacer(),
                StreamBuilder<DurationState>(
                  stream: _durationState,
                  builder: (context, snapshot) {
                    final durationState = snapshot.data;

                    progress = durationState?.progress ?? Duration.zero;
                    buffered = durationState?.buffered ?? Duration.zero;
                    final total = durationState?.total ?? Duration.zero;
                    return Theme(
                      data: ThemeData.dark(),
                      child: ProgressBar(
                        progress: progress!,
                        buffered: buffered,
                        progressBarColor: Colors.black.withOpacity(0.5),
                        baseBarColor: Colors.black.withOpacity(0.2),
                        bufferedBarColor: Colors.black.withOpacity(0.4),
                        thumbColor: Colors.black,
                        total: total,
                        onSeek: (duration) {
                          _player!.seek(duration);
                        },
                      ),
                    );
                  },
                ),
                // const SizedBox(height: 35),
                Row(
                  children: [
                    Spacer(),
                    GestureDetector(
                        onTap: () => progress!.inSeconds < 10
                            ? () {}
                            : _player!.seek(
                                Duration(seconds: progress!.inSeconds - 10)),
                        child: CustomWidget.customAssetImageWidget(
                          height: 3.0,
                          width: 3.0,
                          image: Assets.assetsBackward,
                        )),
                    Spacer(),
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
                                image: Assets.assetsPause,
                              ));
                        } else if (processingState !=
                            ProcessingState.completed) {
                          return GestureDetector(
                              onTap: _player!.pause,
                              child: CustomWidget.customAssetImageWidget(
                                height: 8.0,
                                width: 8.0,
                                image: Assets.assetsPause,
                              ));
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
                    GestureDetector(
                        onTap: () => _player!
                            .seek(Duration(seconds: progress!.inSeconds + 10)),
                        child: CustomWidget.customAssetImageWidget(
                          height: 3.0,
                          width: 3.0,
                          image: Assets.assetsForward,
                        )),
                    Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ],
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

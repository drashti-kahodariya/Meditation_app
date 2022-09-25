import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meditation_app/Data/Model/dashboard_meditation_model.dart';
import 'package:meditation_app/Data/Model/episode_model.dart';
import 'package:meditation_app/Data/Model/favourite_model.dart';
import 'package:meditation_app/Repository/home_repository.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/generated/l10n.dart';
import 'package:path_provider/path_provider.dart';

class HomeController extends GetxController {
  final homeRepository = HomeRepository();
  var dashboardMeditationList = <DashboardData>[].obs;
  var favouriteList = <FavouriteData>[].obs;
  var recentList = <EpisodeData>[].obs;
  var notificationList = <EpisodeData>[].obs;
  var downloadList = <EpisodeData>[].obs;
  var tempRecentList = [].obs;

  /// Get the greeting from the current time of user
  String greetingMessage() {
    var timeNow = DateTime.now().hour;
    printInfo(info: timeNow.toString());
    if (timeNow <= 12) {
      return S.of(Get.context!).goodMorning;
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      return S.of(Get.context!).goodAfternoon;
    } else if ((timeNow > 16) && (timeNow < 20)) {
      return S.of(Get.context!).goodMorning;
    } else {
      return S.of(Get.context!).goodNight;
    }
  }

  getDashboardMeditation() async {
    final getDashboardMeditationResponse =
        await homeRepository.homeScreenApiCall();
    dashboardMeditationList.clear();
    dashboardMeditationList
        .addAll(getDashboardMeditationResponse.dashboardList!);
  }

  getFavoriteList() async {
    favouriteList.clear();
    final getFavouriteListResponse = await homeRepository.getFavouriteApiCall();
    favouriteList.addAll(getFavouriteListResponse.favouriteList!);
  }

  addFavoriteList(Map<String, String> params) async {
    await homeRepository.addFavouriteApiCall(params);
    getFavoriteList();
  }

  addInRecent(EpisodeData episode) {
    var recentList = GetStorage().read(AppPreferencesHelper.recent) ?? [];
    tempRecentList.addAll(GetStorage().read(AppPreferencesHelper.recent) ?? []);
    Map isEpisodeAvailable = tempRecentList.firstWhere(
        (element) => element['_id'] == episode.sId,
        orElse: () => {});
    if (isEpisodeAvailable.isEmpty) {
      tempRecentList.add(episode.toJson());
      GetStorage().write(AppPreferencesHelper.recent, tempRecentList);
    }
  }

  getAndSetRecent() {
    recentList.clear();
    List<dynamic> tempRecent =
        GetStorage().read(AppPreferencesHelper.recent) ?? [];
    for (var i = 0; i < tempRecent.length; i++) {
      recentList.add(EpisodeData.fromJson(tempRecent[i]));
    }
  }

  getNotificationList() async {
    notificationList.clear();
    final getNotificationListResponse =
        await homeRepository.getNotificationApiCall();
    notificationList.addAll(getNotificationListResponse.episodeList!);
  }

  downloadFile(EpisodeData audioData) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File("${appStorage.path}/${audioData.sId}");

    final response = await Dio().get(
      audioData.audioOrVideo!,
      options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );
    final raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(response.data);
    await raf.close();
    addInDownloads(path: file.path, audioData: audioData);
  }

  addInDownloads({required EpisodeData audioData, required String path}) {
    var tempDownloadsList = [].obs;
    tempDownloadsList
        .addAll(GetStorage().read(AppPreferencesHelper.downloads) ?? []);
    tempDownloadsList.add(EpisodeData(
            audioOrVideo: path,
            title: audioData.title,
            image: audioData.image,
            description: audioData.description,
            courseId: audioData.courseId)
        .toJson());
    GetStorage().write(AppPreferencesHelper.downloads, tempDownloadsList);
  }

  getAndSetDownloads() {
    downloadList.clear();
    List<dynamic> tempDownload =
        GetStorage().read(AppPreferencesHelper.recent) ?? [];
    for (var i = 0; i < tempDownload.length; i++) {
      downloadList.add(EpisodeData.fromJson(tempDownload[i]));
    }
  }
}

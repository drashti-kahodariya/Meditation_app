import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meditation_app/Data/Model/dashboard_meditation_model.dart';
import 'package:meditation_app/Data/Model/episode_model.dart';
import 'package:meditation_app/Data/Model/favourite_model.dart';
import 'package:meditation_app/Repository/home_repository.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/generated/l10n.dart';

class HomeController extends GetxController {
  final homeRepository = HomeRepository();
  var dashboardMeditationList = <DashboardData>[].obs;
  var favouriteList = <FavouriteData>[].obs;
  var recentList = <EpisodeData>[].obs;
  var notificationList = <EpisodeData>[].obs;

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

  addInRecent(EpisodeData course) {
    var tempRecentList = <Map<String, dynamic>>[].obs;
    tempRecentList.add(course.toJson());
    GetStorage().write(AppPreferencesHelper.recent, tempRecentList);
    print("RECENT LIST:: ${GetStorage().read(AppPreferencesHelper.recent)}");
  }

  getAndSetRecent() {
    recentList.clear();
    List<dynamic> tempRecent = GetStorage().read(AppPreferencesHelper.recent);
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
}

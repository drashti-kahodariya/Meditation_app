import 'package:get/get.dart';
import 'package:meditation_app/Data/Model/dashboard_meditation_model.dart';
import 'package:meditation_app/Models/favourite_model.dart';
import 'package:meditation_app/Repository/home_repository.dart';

class HomeController extends GetxController {
  final homeRepository = HomeRepository();
  var dashboardMeditationList = <DashboardData>[].obs;
  var favouriteList = <FavouriteData>[].obs;

  /// Get the greeting from the current time of user
  String greetingMessage() {
    var timeNow = DateTime.now().hour;
    printInfo(info: timeNow.toString());
    if (timeNow <= 12) {
      return 'Good Morning';
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      return 'Good Afternoon';
    } else if ((timeNow > 16) && (timeNow < 20)) {
      return 'Good Evening';
    } else {
      return 'Good Night';
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
    final getFavouriteListResponse = await homeRepository.getFavouriteApiCall();
    favouriteList.clear();
    favouriteList.addAll(getFavouriteListResponse.favouriteList!);
  }
}

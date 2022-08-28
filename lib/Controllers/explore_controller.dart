import 'package:get/get.dart';
import 'package:meditation_app/Models/explore_model.dart';
import 'package:meditation_app/Models/get_featured_course_model.dart';
import 'package:meditation_app/Repository/explore_repository.dart';

class ExploreController extends GetxController {
  var exploreRepository = ExploreRepository();
  var exploreList = <ExploreData>[].obs;
  var featuredCourseList = FeaturedCourseData().obs;

  getExploreData() async {
    final getExploreResponse = await exploreRepository.exploreApiCall();
    exploreList.clear();
    exploreList.addAll(getExploreResponse.exploreList!);
  }

  getFeaturedData(Map<String, dynamic> params) async {
    final getFeaturedCourseResponse =
        await exploreRepository.featuredApiCall(params);
    // featuredCourseList.clear();
    featuredCourseList.value = getFeaturedCourseResponse.featuredDataList!;
  }
}

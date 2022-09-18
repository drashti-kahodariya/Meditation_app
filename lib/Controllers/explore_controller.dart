import 'package:get/get.dart';
import 'package:meditation_app/Data/Model/episode_model.dart';
import 'package:meditation_app/Data/Model/explore_course_model.dart';
import 'package:meditation_app/Data/Model/explore_model.dart';
import 'package:meditation_app/Repository/explore_repository.dart';

class ExploreController extends GetxController {
  var exploreRepository = ExploreRepository();
  var exploreList = <ExploreData>[].obs;
  var featuredCourseList = <CourseData>[].obs;
  var exploreCourseList = <ExploreCourseData>[].obs;
  var episodeList = <EpisodeData>[].obs;
  var page = 1.obs;

  getExploreData() async {
    final getExploreResponse = await exploreRepository.exploreApiCall();
    exploreList.clear();
    exploreList.addAll(getExploreResponse.exploreList!);
  }

  getFeaturedData(Map<String, dynamic> params) async {
    final getFeaturedCourseResponse =
        await exploreRepository.featuredApiCall(params);
    featuredCourseList.clear();
    featuredCourseList
        .addAll(getFeaturedCourseResponse.featuredDataList!.courseData!);
  }

  getExploreCourseData(String id) async {
    exploreCourseList.clear();
    final getExploreCourseResponse =
        await exploreRepository.exploreCourseApiCall(id);
    exploreCourseList.addAll(getExploreCourseResponse.exploreCourseList!);
  }

  getEpisodeData(String id) async {
    final episodeResponse = await exploreRepository.episodeApiCall(id);
    episodeList.addAll(episodeResponse.episodeList!);
  }
}

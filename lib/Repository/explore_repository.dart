import 'package:meditation_app/Data/API/api_manager.dart';
import 'package:meditation_app/Data/Model/episode_model.dart';
import 'package:meditation_app/Data/Model/explore_course_model.dart';
import 'package:meditation_app/Data/Model/explore_model.dart';

import '../Data/Model/featured_course_model.dart';

class ExploreRepository {
  final apiManager = APIManager();

  ///
  /// Get the data of Explore Screen
  ///
  Future<ExploreModel> exploreApiCall() async {
    // var json = await apiManager.getAPICall("user/category");
    var json = {
      "status": 200,
      "message": "Category successfully retrieved!",
      "data": [
        {"name": "focus", "_id": "62ebe866fa49320178ad75bc"},
        {"name": "sleep", "_id": "62ebe85ffa49320178ad75b8"},
        {"name": "meditation", "_id": "62ebe859fa49320178ad75b4"}
      ]
    };
    var response = ExploreModel.fromJson(json);

    return response;
  }

  ///
  /// Get the featured course
  ///
  Future<FeaturedCourseModel> featuredApiCall(
      Map<String, dynamic> params) async {
    var json =
        await apiManager.postAPICall("user/course/category_wise", params);
    print("JSON::: ${json}");
    var response = FeaturedCourseModel.fromJson(json);

    return response;
  }

  ///
  /// Get the explore course in featured screen
  ///
  Future<ExploreCourseModel> exploreCourseApiCall(String id) async {
    print("URL user/category/explore/${id}");
    var json = await apiManager.getAPICall("user/category/explore/$id");
    var response = ExploreCourseModel.fromJson(json);

    return response;
  }

  ///
  /// Get the episode of explore
  ///
  Future<EpisodeModel> episodeApiCall(String id) async {
    var json = await apiManager.getAPICall("user/episode/course/$id");
    var response = EpisodeModel.fromJson(json);

    return response;
  }
}

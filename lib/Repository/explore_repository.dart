import 'package:meditation_app/Data/API/api_manager.dart';
import 'package:meditation_app/Models/explore_model.dart';

import '../Models/get_featured_course_model.dart';

class ExploreRepository {
  final apiManager = APIManager();

  ///
  /// Get the data of Explore Screen
  ///
  Future<ExploreModel> exploreApiCall() async {
    var json = await apiManager.getAPICall("user/category");
    var response = ExploreModel.fromJson(json);

    return response;
  }

  ///
  /// Get the featured course
  ///
  Future<GetFeaturedCourseModel> featuredApiCall(
      Map<String, String> params) async {
    print("PARAMS:: ${params}");
    var json =
        await apiManager.postAPICall("user/course/category_wise", params);
    print("JSON::: ${json}");
    var response = GetFeaturedCourseModel.fromJson(json);

    return response;
  }
}

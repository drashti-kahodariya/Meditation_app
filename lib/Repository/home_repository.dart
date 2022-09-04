import 'package:meditation_app/Data/API/api_manager.dart';
import 'package:meditation_app/Data/Model/common_model.dart';
import 'package:meditation_app/Data/Model/dashboard_meditation_model.dart';
import 'package:meditation_app/Data/Model/favourite_model.dart';

class HomeRepository {
  final apiManager = APIManager();

  Future<DashboardMeditationModel> homeScreenApiCall() async {
    var json = await apiManager.getAPICall("user/dashboard");
    var response = DashboardMeditationModel.fromJson(json);

    return response;
  }

  Future<FavouriteModel> getFavouriteApiCall() async {
    var json = await apiManager.getAPICall("user/favorite");
    var response = FavouriteModel.fromJson(json);
    return response;
  }

  Future<CommonResponseModel> addFavouriteApiCall(
      Map<String, String> params) async {
    var json = await apiManager.postAPICall("user/favorite/add", params);
    var response = CommonResponseModel.fromJson(json);
    return response;
  }
}

import 'package:meditation_app/Data/API/api_manager.dart';
import 'package:meditation_app/Data/Model/dashboard_meditation_model.dart';
import 'package:meditation_app/Models/favourite_model.dart';

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
}

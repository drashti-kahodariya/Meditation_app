import 'package:meditation_app/Data/API/api_manager.dart';
import 'package:meditation_app/Data/Model/google_login_model.dart';
import 'package:meditation_app/Models/login_success_response_model.dart';

class AuthenticationRepository {
  final APIManager apiManager;

  AuthenticationRepository(this.apiManager);

  ///Signup API call
  Future<LoginSuccessResponseModel> signupApiCall(
      Map<String, String> parameters) async {
    var json = await apiManager.postAPICall(
      "user/signup",
      parameters,
    );
    var response = LoginSuccessResponseModel.fromJson(json);
    return response;
  }

  /// Login API call
  Future<LoginSuccessResponseModel> loginApiCall(
      Map<String, String> parameters) async {
    var json = await apiManager.postAPICall(
      "user/login",
      parameters,
    );
    var response = LoginSuccessResponseModel.fromJson(json);
    return response;
  }
  ///
  /// This method used for the do sign in with google
  ///
  Future<LoginSuccessResponseModel> signInWithGoogle(
      String? accessToken, String? idToken) async {
    var goggleLoginModel = GoogleLoginRequestModel();

    goggleLoginModel.idToken = idToken;
    goggleLoginModel.accessToken = accessToken;
    goggleLoginModel.deviceToken = "123";
    var jsonResponse =
    await apiManager.postAPICall("user/google_login", goggleLoginModel.toJson());
    var loginResponse = LoginSuccessResponseModel.fromJson(jsonResponse);
    return loginResponse;
  }
  ///
  /// This method used for the do sign in with facebook
  ///
  Future<LoginSuccessResponseModel> signInWithApple(
      {String? appleAuthCode, String? email, String? name}) async {
    var jsonResponse = await apiManager.postAPICall("user/apple_login", {
      "firstName": name,
      "lastName": name,
      "email": email,
      "appleAuthCode": [appleAuthCode].toString(),
      "deviceToken": ""
    });
    var loginResponse = LoginSuccessResponseModel.fromJson(jsonResponse);
    return loginResponse;
  }
}

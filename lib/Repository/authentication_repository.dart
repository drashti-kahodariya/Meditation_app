import 'package:http/http.dart' as http;
import 'package:meditation_app/Data/API/api_manager.dart';
import 'package:meditation_app/Data/Model/google_login_model.dart';
import 'package:meditation_app/Models/common_model.dart';
import 'package:meditation_app/Models/login_success_response_model.dart';
import 'package:meditation_app/Models/upload_image_response_model.dart';

class AuthenticationRepository {
  final APIManager apiManager;

  AuthenticationRepository(this.apiManager);

  ///Signup API
  Future<LoginSuccessResponseModel> signupApiCall(
      Map<String, String> params) async {
    var json = await apiManager.postAPICall(
      "user/signup",
      params,
    );
    var response = LoginSuccessResponseModel.fromJson(json);
    return response;
  }

  /// Login API
  Future<LoginSuccessResponseModel> loginApiCall(
      Map<String, String> params) async {
    var json = await apiManager.postAPICall(
      "user/login",
      params,
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
    var jsonResponse = await apiManager.postAPICall(
        "user/google_login", goggleLoginModel.toJson());
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

  ///
  /// This method used for getProfile
  ///
  Future<LoginSuccessResponseModel> getProfile() async {
    var jsonResponse = await apiManager.getAPICall("user/get_profile");
    var editResponse = LoginSuccessResponseModel.fromJson(jsonResponse);
    return editResponse;
  }

  ///
  /// This method used for edit Profile
  ///
  Future<LoginSuccessResponseModel> editProfile({
    required String? fName,
    required String? lName,
    required String? mobNo,
    required String? email,
    required String? imagePath,
  }) async {
    var jsonResponse = await apiManager.putAPICall("user/update_profile", {
      "firstName": fName,
      "lastName": lName,
      "email": email,
      "mobileNumber": mobNo,
      "image": imagePath,
    });
    var editResponse = LoginSuccessResponseModel.fromJson(jsonResponse);
    return editResponse;
  }

  ///
  /// This method used for upload profile image
  ///
  Future<UploadImageResponseModel> uploadProfileImage({
    required http.MultipartFile file,
  }) async {
    var jsonResponse = await apiManager.postFormData("upload/profile", file);
    var editResponse = UploadImageResponseModel.fromJson(jsonResponse);
    return editResponse;
  }

  ///
  ///Forgot password API calling
  ///
  Future<CommonResponseModel> forgotPasswordApiCall(
      Map<String, String> params) async {
    var jsonResponse =
        await apiManager.postAPICall("user/forgot_password", params);
    var forgotPasswordResponse = CommonResponseModel.fromJson(jsonResponse);
    return forgotPasswordResponse;
  }

  ///
  ///Otp verification API calling
  ///
  Future<CommonResponseModel> otpVerificationApiCall(
      Map<String, String> params) async {
    var jsonResponse =
        await apiManager.postAPICall("user/otp_verification", params);
    var otpResponse = CommonResponseModel.fromJson(jsonResponse);
    return otpResponse;
  }

  ///
  ///Resend otp verification API calling
  ///
  Future<CommonResponseModel> resendOtpVerificationApiCall(
      Map<String, String> params) async {
    var jsonResponse = await apiManager.postAPICall("user/resend_otp", params);
    var resendOtpResponse = CommonResponseModel.fromJson(jsonResponse);
    return resendOtpResponse;
  }

  ///
  ///Set new password API calling
  ///
  Future<CommonResponseModel> setNewPasswordApiCall(
      Map<String, String> params) async {
    var jsonResponse =
        await apiManager.postAPICall("user/change_password", params);
    var forgotPasswordResponse = CommonResponseModel.fromJson(jsonResponse);
    return forgotPasswordResponse;
  }
}

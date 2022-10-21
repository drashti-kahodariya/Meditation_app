import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:meditation_app/Data/API/api_manager.dart';
import 'package:meditation_app/Data/Model/login_success_response_model.dart';
import 'package:meditation_app/Repository/authentication_repository.dart';
import 'package:meditation_app/Routes/routes.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/Utils/custom_widget.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';

class AuthenticationController extends GetxController {
  final authenticationRepository = AuthenticationRepository(APIManager());

  final currentUserData = UserData().obs;

  ///
  /// This method used for set the current login user to the app
  ///
  setCurrentUser() {
    printInfo(info: GetStorage().read(AppPreferencesHelper.pUser).toString());
    currentUserData.value =
        UserData.fromJson(GetStorage().read(AppPreferencesHelper.pUser));
  }

  ///
  /// You have to use this method in registration form same as i used in the login screen
  ///
  Future<void> login(Map<String, String> params) async {
    var loginData = await authenticationRepository.loginApiCall(params);
    GetStorage()
        .write(AppPreferencesHelper.pUser, loginData.userData!.toJson());
    setCurrentUser();
    Get.offAllNamed(Routes.dashboard);
  }

  ///
  /// You have to use this method in registration form same as i used in the login screen
  ///
  Future<void> signUp(Map<String, String> params) async {
    var loginData = await authenticationRepository.signupApiCall(params);
    GetStorage()
        .write(AppPreferencesHelper.pUser, loginData.userData!.toJson());
    setCurrentUser();
    Get.offAllNamed(Routes.dashboard);
  }

  ///
  /// sign in with google
  ///
  void signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? firebaseUser;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        firebaseUser = userCredential.user;

        var loginData = await authenticationRepository.signInWithGoogle(
            googleSignInAuthentication.accessToken,
            googleSignInAuthentication.idToken);
        GetStorage()
            .write(AppPreferencesHelper.pUser, loginData.userData!.toJson());
        setCurrentUser();
        Get.offAllNamed(Routes.dashboard);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          CustomWidget.errorSnackBar(content: 'Account Already Exist');
        } else if (e.code == 'invalid-credential') {
          CustomWidget.errorSnackBar(content: 'Invalid Credentials');
        }
      } catch (e) {
        rethrow;
      }
    }
  }

  ///
  /// Sign in with apple
  ///

  signInWithApple() async {
    final _firebaseAuth = FirebaseAuth.instance;
    List<Scope> scopes = const [];

    // 1. perform the sign-in request
    final result = await TheAppleSignIn.performRequests(
        [AppleIdRequest(requestedScopes: scopes)]);
    // 2. check the result
    switch (result.status) {
      case AuthorizationStatus.authorized:
        final appleIdCredential = result.credential!;
        final oAuthProvider = OAuthProvider('apple.com');
        final credential = oAuthProvider.credential(
          idToken: String.fromCharCodes(appleIdCredential.identityToken!),
          accessToken:
              String.fromCharCodes(appleIdCredential.authorizationCode!),
        );
        final userCredential =
            await _firebaseAuth.signInWithCredential(credential);
        final firebaseUser = userCredential.user!;
        if (scopes.contains(Scope.fullName)) {
          final fullName = appleIdCredential.fullName;
          if (fullName != null &&
              fullName.givenName != null &&
              fullName.familyName != null) {
            final displayName = '${fullName.givenName} ${fullName.familyName}';
            await firebaseUser.updateDisplayName(displayName);
          }
        }
        var loginData = await authenticationRepository.signInWithApple(
            appleAuthCode:
                String.fromCharCodes(appleIdCredential.authorizationCode!),
            email: firebaseUser.email,
            name: firebaseUser.displayName ?? "");

        // var loginData = await authenticationRepository.signInWithApple(
        //     appleAuthCode:
        //         String.fromCharCodes(appleIdCredential.authorizationCode!),
        //     email: firebaseUser.email,
        //     name: firebaseUser.displayName ?? "");
        // print(loginData.userData!.toJson());
        // GetStorage().write(
        //     AppPreferencesHelper.pUser,
        //     UserData(
        //         sId: "630239f7e0e332667fba5381",
        //         loginType: 1,
        //         lastName: "",
        //         isUserPremium: false,
        //         image: "",
        //         firstName: "User",
        //         email: "",
        //         mobileNumber: "",
        //         refreshToken:
        //         "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MzAyMzlmN2UwZTMzMjY2N2ZiYTUzODEiLCJhdXRoVG9rZW4iOjYzMTAzOSwidHlwZSI6MCwic3RhdHVzIjoiTG9naW4iLCJnZW5lcmF0ZWRPbiI6MTY2NjEwMjk0OTAxNywiaWF0IjoxNjY2MTAyOTQ5fQ.P7EMs6eM5NDal8j1veiDzNv6gRMCueRE0gPN601afJ0",
        //         token:
        //         "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MzAyMzlmN2UwZTMzMjY2N2ZiYTUzODEiLCJhdXRoVG9rZW4iOjYzMTAzOSwidHlwZSI6MCwic3RhdHVzIjoiTG9naW4iLCJnZW5lcmF0ZWRPbiI6MTY2NjEwMjk0OTAxNywiaWF0IjoxNjY2MTAyOTQ5fQ.P7EMs6eM5NDal8j1veiDzNv6gRMCueRE0gPN601afJ0",
        //         userType: 0).toJson());
        // setCurrentUser();
        // Get.offAllNamed(Routes.dashboard);
        GetStorage()
            .write(AppPreferencesHelper.pUser, loginData.userData!.toJson());
        setCurrentUser();
        Get.offAllNamed(Routes.dashboard);
        break;

      case AuthorizationStatus.error:
        print("ERROR::: ${result.error.toString()}");
        throw PlatformException(
          code: 'ERROR_AUTHORIZATION_DENIED',
          message: result.error.toString(),
        );
        break;

      case AuthorizationStatus.cancelled:
        throw PlatformException(
          code: 'ERROR_ABORTED_BY_USER',
          message: 'Sign in aborted by user',
        );
        break;
      default:
        throw UnimplementedError();
    }
  }

  ///
  /// This method used for getUser Details from api and set current user to App
  ///
  getAndSetUser() async {
    var getProfileResponse = await authenticationRepository.getProfile();
    print(getProfileResponse.toJson());
    getProfileResponse.userData!.token = currentUserData.value.token;
    getProfileResponse.userData!.refreshToken =
        currentUserData.value.refreshToken;
    GetStorage().write(
        AppPreferencesHelper.pUser, getProfileResponse.userData!.toJson());
    setCurrentUser();
  }

  ///
  /// This method used for call edit profile API
  /// If user change image then call upload image API and after call editProfile API and pass image url got from upload image api
  ///
  editImage(String fName, String lName, String mobNo, String email,
      {String? filePath}) async {
    if (filePath != null) {
      var imageResponse = await authenticationRepository.uploadProfileImage(
          file: await http.MultipartFile.fromPath('image', filePath,
              contentType: MediaType('image', 'png')));

      await authenticationRepository.editProfile(
          email: email,
          imagePath: imageResponse.imageData!.image,
          fName: fName,
          lName: lName,
          mobNo: mobNo);
      getAndSetUser();
      CustomWidget.successSnackBar(content: "Updated Successfully");
    } else {
      await authenticationRepository.editProfile(
          email: email,
          imagePath: currentUserData.value.image,
          fName: fName,
          lName: lName,
          mobNo: mobNo);
      getAndSetUser();
      CustomWidget.successSnackBar(content: "Updated Successfully");
    }
  }

  ///
  /// You have to use this method for forgot password to get link in you mail
  ///
  Future<void> forgotPassword(Map<String, String> params) async {
    var forgotPasswordData =
        await authenticationRepository.forgotPasswordApiCall(params);
    Get.toNamed(Routes.otpVerificationScreen);
  }

  ///
  /// You have to use this method for otp verification
  ///
  Future<void> otpVerification(Map<String, String> params) async {
    var otpVerificationData =
        await authenticationRepository.otpVerificationApiCall(params);

    Get.offAllNamed(Routes.setNewPasswordScreen,
        arguments: otpVerificationData["data"]["_id"]);
  }

  ///
  /// You have to use this method for set new password
  ///
  Future<void> setNewPassword(Map<String, String> params) async {
    await authenticationRepository.setNewPasswordApiCall(params);
    Get.offAllNamed(Routes.loginScreen);
  }

  ///
  /// This method use for delete account
  ///
  Future<void> deleteAccount(Map<String, String> params) async {
    await authenticationRepository.deleteAccountApiCall(params);
    GetStorage().erase();
    Get.offAllNamed(Routes.welcomeScreen);
  }

  ///
  /// This method used for sign out user from app
  ///
  logOut() {
    GetStorage().erase();
    Get.offAllNamed(Routes.welcomeScreen);
  }
}

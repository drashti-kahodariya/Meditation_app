import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meditation_app/Data/API/api_manager.dart';
import 'package:meditation_app/Models/login_success_response_model.dart';
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
    print("LOGIN DONE");
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
    print("REGISTRATION DONE");
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
            appleAuthCode: String.fromCharCodes(appleIdCredential.authorizationCode!),email: firebaseUser.email,name: firebaseUser.displayName ?? "");
        GetStorage()
            .write(AppPreferencesHelper.pUser, loginData.userData!.toJson());
        setCurrentUser();
        Get.offAllNamed(Routes.homeScreen);
        break;

      case AuthorizationStatus.error:
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
  /// This method used for sign out user from app
  ///
  logOut() {
    GetStorage().erase();
    Get.offAllNamed(Routes.loginScreen);
  }
}

import 'package:get/get.dart' show GetPage, Transition;
import 'package:meditation_app/Routes/routes.dart';
import 'package:meditation_app/Screens/dashboard.dart';
import 'package:meditation_app/Screens/favourite_screen.dart';
import 'package:meditation_app/Screens/home_screen.dart';
import 'package:meditation_app/Screens/login_screen.dart';
import 'package:meditation_app/Screens/notification_screen.dart';
import 'package:meditation_app/Screens/recent_screen.dart';
import 'package:meditation_app/Screens/signup_screen.dart';
import 'package:meditation_app/Screens/splash_screen.dart';
import 'package:meditation_app/Screens/welcome_screen.dart';

const Transition transition = Transition.cupertino;

class AppPages {
  // ignore: constant_identifier_names
  static const INITIAL = Routes.splashScreen;

  static final routes = [
    GetPage(
        name: Routes.splashScreen,
        page: () => const SplashScreen(),
        transition: transition),
    GetPage(
        name: Routes.welcomeScreen,
        page: () => const WelcomeScreen(),
        transition: transition),
    GetPage(
        name: Routes.loginScreen,
        page: () => const LoginScreen(),
        transition: transition),
    GetPage(
        name: Routes.signUpScreen,
        page: () => const SignupScreen(),
        transition: transition),
    GetPage(
        name: Routes.homeScreen,
        page: () => const HomeScreen(),
        transition: transition),
    GetPage(
        name: Routes.recentScreen,
        page: () => const RecentScreen(),
        transition: transition),
    GetPage(
        name: Routes.favouriteScreen,
        page: () => const FavouriteScreen(),
        transition: transition),
    GetPage(
        name: Routes.dashboard,
        page: () => const Dashboard(),
        transition: transition),
    GetPage(
        name: Routes.notificationScreen,
        page: () => const NotificationScreen(),
        transition: transition),
  ];
}

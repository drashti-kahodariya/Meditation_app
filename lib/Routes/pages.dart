import 'package:get/get.dart' show GetPage, Transition;
import 'package:meditation_app/Routes/routes.dart';
import 'package:meditation_app/Screens/Explore/explore_screen.dart';
import 'package:meditation_app/Screens/Explore/featured_screen.dart';
import 'package:meditation_app/Screens/Explore/music_play_screen.dart';
import 'package:meditation_app/Screens/Home/favourite_screen.dart';
import 'package:meditation_app/Screens/Home/home_screen.dart';
import 'package:meditation_app/Screens/Home/notification_screen.dart';
import 'package:meditation_app/Screens/Home/recent_screen.dart';
import 'package:meditation_app/Screens/Onboarding/forgot_password.dart';
import 'package:meditation_app/Screens/Onboarding/login_screen.dart';
import 'package:meditation_app/Screens/Onboarding/signup_screen.dart';
import 'package:meditation_app/Screens/Onboarding/splash_screen.dart';
import 'package:meditation_app/Screens/Onboarding/welcome_screen.dart';
import 'package:meditation_app/Screens/Settings/downloads_screen.dart';
import 'package:meditation_app/Screens/Settings/edit_profile.dart';
import 'package:meditation_app/Screens/Settings/invite_friends.dart';
import 'package:meditation_app/Screens/Settings/profile_screen.dart';
import 'package:meditation_app/Screens/Settings/settings_screen.dart';
import 'package:meditation_app/Screens/Settings/support_screen.dart';
import 'package:meditation_app/Screens/dashboard.dart';
import 'package:meditation_app/Screens/subscription_screen.dart';

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
    GetPage(
        name: Routes.exploreScreen,
        page: () => const ExploreScreen(),
        transition: transition),
    GetPage(
        name: Routes.musicPlayScreen,
        page: () => const MusicPlayScreen(),
        transition: transition),
    GetPage(
        name: Routes.settingScreen,
        page: () => const SettingScreen(),
        transition: transition),
    GetPage(
        name: Routes.profileScreen,
        page: () => const ProfileScreen(),
        transition: transition),
    GetPage(
        name: Routes.editProfileScreen,
        page: () => const EditProfile(),
        transition: transition),
    GetPage(
        name: Routes.inviteFriendsScreen,
        page: () => const InviteFriends(),
        transition: transition),
    GetPage(
        name: Routes.downloadsScreen,
        page: () => const DownloadsScreen(),
        transition: transition),
    GetPage(
        name: Routes.forgotPasswordScreen,
        page: () => const ForgotPassword(),
        transition: transition),
    GetPage(
        name: Routes.subscriptionScreen,
        page: () => const SubScriptionScreen(),
        transition: transition),
    GetPage(
        name: Routes.featuredScreen,
        page: () => const FeaturedScreen(),
        transition: transition),
    GetPage(
        name: Routes.supportScreen,
        page: () => const SupportScreen(),
        transition: transition),
  ];
}

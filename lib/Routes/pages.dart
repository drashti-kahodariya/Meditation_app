import 'package:get/get.dart' show GetPage, Transition;
import 'package:meditation_app/Routes/routes.dart';
import 'package:meditation_app/Screens/splash_screen.dart';

const Transition transition = Transition.cupertino;

class AppPages {
  // ignore: constant_identifier_names
  static const INITIAL = Routes.splashScreen;

  static final routes = [
    GetPage(
        name: Routes.splashScreen,
        page: () => const SplashScreen(),
        transition: transition),
  ];
}

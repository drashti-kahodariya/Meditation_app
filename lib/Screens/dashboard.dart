import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/Controllers/authentication_controller.dart';
import 'package:meditation_app/Controllers/explore_controller.dart';
import 'package:meditation_app/Screens/Explore/featured_screen.dart';
import 'package:meditation_app/Screens/Home/home_screen.dart';
import 'package:meditation_app/Screens/Settings/profile_screen.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/generated/assets.dart';
import 'package:meditation_app/generated/l10n.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:sizer/sizer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  var authController = Get.put(AuthenticationController());
  var exploreController = Get.put(ExploreController());

  final _selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => BottomNavigationBar(
          currentIndex: _selectedIndex.value,
          onTap: (int index) {
            _selectedIndex.value = index;
            if (_selectedIndex.value == 1) {
              exploreController.getFeaturedData({
                "categoryId": "62ebe859fa49320178ad75b4",
                "page": exploreController.page.value,
                "limit": 10
              });
              exploreController
                  .getExploreCourseData("62ebe859fa49320178ad75b4");
            } else if (_selectedIndex.value == 2) {
              exploreController.getFeaturedData({
                "categoryId": "62ebe85ffa49320178ad75b8",
                "page": exploreController.page.value,
                "limit": 10
              });
              exploreController
                  .getExploreCourseData("62ebe85ffa49320178ad75b8");
            } else {
              exploreController.getFeaturedData({
                "categoryId": "62ebe866fa49320178ad75bc",
                "page": exploreController.page.value,
                "limit": 10
              });
              exploreController
                  .getExploreCourseData("62ebe866fa49320178ad75bc");
            }
          },
          selectedItemColor: AppColor.lightPinkColor,
          unselectedItemColor: AppColor.whiteColor.withOpacity(0.7),
          backgroundColor: AppColor.backgroundColor,
          type: BottomNavigationBarType.fixed,
          items: navBarsItems())),
      body: Obx(() => buildScreens()[_selectedIndex.value]),
    );
  }

  ///
  /// This method return the screen according to tab selection from bottomNavigationBar
  ///
  List<Widget> buildScreens() {
    return [
      const HomeScreen(),
      const FeaturedScreen(
          id: "62ebe859fa49320178ad75b4",
          image: Assets.assetsFocusImage,
          name: "Meditate"),
      const FeaturedScreen(
          id: "62ebe85ffa49320178ad75b8",
          image: Assets.assetsSleepImage,
          name: "Sleep"),
      const FeaturedScreen(
          id: "62ebe866fa49320178ad75bc",
          image: Assets.assetsMeditateImage,
          name: "Focus"),
      const ProfileScreen(),
    ];
  }

  ///
  /// This method returns the navBarItems
  ///
  List<BottomNavigationBarItem> navBarsItems() {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: const NavBarItemImage(
          image: Assets.assetsToday,
        ),
        activeIcon: const NavBarItemImage(
          image: Assets.assetsSelectedToday,
          fromSelected: true,
        ),
        label: S.of(context).today,
      ),
      BottomNavigationBarItem(
        icon: const NavBarItemImage(
          image: Assets.assetsMeditateIcon,
        ),
        activeIcon: const NavBarItemImage(
            image: Assets.assetsSelectedMeditate, fromSelected: true),
        label: S.of(context).meditate,
      ),
      BottomNavigationBarItem(
        icon: const NavBarItemImage(
          image: Assets.assetsSleepIcon,
        ),
        activeIcon: const NavBarItemImage(
            image: Assets.assetsSelectedSleep, fromSelected: true),
        label: S.of(context).sleep,
      ),
      BottomNavigationBarItem(
        icon: const NavBarItemImage(
          image: Assets.assetsFocusIcon,
        ),
        activeIcon: const NavBarItemImage(
            image: Assets.assetsSelectedFocus, fromSelected: true),
        label: S.of(context).focus,
      ),
      BottomNavigationBarItem(
        icon: const NavBarItemImage(
          image: Assets.assetsProfileIcon,
        ),
        activeIcon: const NavBarItemImage(
            image: Assets.assetsSelectedProfile, fromSelected: true),
        label: authController.currentUserData.value.firstName == "null"
            ? S.of(context).profile
            : "${authController.currentUserData.value.firstName}",
      ),
    ];
  }
}

class NavBarItemImage extends StatelessWidget {
  const NavBarItemImage(
      {Key? key, required this.image, this.fromSelected = false})
      : super(key: key);

  final String image;
  final bool fromSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 2),
      height: fromSelected ? 4.0.h : 3.0.h,
      width: fromSelected ? 4.0.h : 3.0.h,
      child: Image.asset(
        image,
      ),
    );
  }
}

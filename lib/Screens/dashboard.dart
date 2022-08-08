import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/Screens/favourite_screen.dart';
import 'package:meditation_app/Screens/home_screen.dart';
import 'package:meditation_app/Screens/recent_screen.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  List<Widget> _buildScreens() {
    return [const HomeScreen(), const FavouriteScreen(), const RecentScreen()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.home,
          size: 30,
        ),
        title: ("Home"),
        activeColorPrimary: AppColor.lightPinkColor,
        inactiveColorPrimary: AppColor.whiteColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.search,
          size: 30,
        ),
        title: ("Favourite"),
        activeColorPrimary: AppColor.lightPinkColor,
        inactiveColorPrimary: AppColor.whiteColor,
        // onPressed: (context) async {
        //   var videoController = Get.put(VideoController());
        //   await videoController.getFavouriteVideoList();
        //   _controller.index = 1;
        // },
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.person,
          size: 30,
        ),
        title: ("Settings"),
        activeColorPrimary: AppColor.lightPinkColor,
        inactiveColorPrimary: AppColor.whiteColor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: AppColor.backgroundColor, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10.0), topLeft: Radius.circular(10.0)),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style2, // Choose the nav bar style with this property.
    );
  }
}

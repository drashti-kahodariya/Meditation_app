import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/Screens/Explore/explore_screen.dart';
import 'package:meditation_app/Screens/Home/home_screen.dart';
import 'package:meditation_app/Screens/Settings/profile_screen.dart';
import 'package:meditation_app/Utils/constant.dart';
import 'package:meditation_app/generated/assets.dart';
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
  final _selectedIndex = 0.obs;

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
        title: ("Explore"),
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
    return Scaffold(
      bottomNavigationBar: Obx(() => BottomNavigationBar(
          currentIndex: _selectedIndex.value,
          onTap: (int index) {
            _selectedIndex.value = index;
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
      const ExploreScreen(),
      const ProfileScreen(),
    ];
  }

  ///
  /// This method returns the navBarItems
  ///
  List<BottomNavigationBarItem> navBarsItems() {
    return <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: NavBarItemImage(
          image: Assets.assetsToday,
        ),
        activeIcon: NavBarItemImage(
          image: Assets.assetsSelectedToday,
          fromSelected: true,
        ),
        label: "Today",
      ),
      const BottomNavigationBarItem(
        icon: NavBarItemImage(
          image: Assets.assetsSearch,
        ),
        activeIcon: NavBarItemImage(
            image: Assets.assetsSelectedExplore, fromSelected: true),
        label: "Today",
      ),
      const BottomNavigationBarItem(
        icon: NavBarItemImage(
          image: Assets.assetsProfileIcon,
        ),
        activeIcon: NavBarItemImage(
            image: Assets.assetsSelectedProfile, fromSelected: true),
        label: "Today",
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

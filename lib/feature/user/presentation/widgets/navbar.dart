import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '/common/app_colors.dart';
import '/common/localization.dart';
import '../pages/home/home.dart';

class Navbar extends StatelessWidget {
  Navbar({super.key});

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      const HomePage(),
      const Plug(number: 2),
      const Plug(number: 3),
      const Plug(number: 4),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(context),
      confineInSafeArea: true,
      navBarHeight: 70,
      backgroundColor: Color(0xFF2e3842),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(

        // borderRadius: const BorderRadius.only(
        //   topLeft: Radius.circular(16),
        //   topRight: Radius.circular(16),
        // ),

        colorBehindNavBar: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 10,
            blurRadius: 100,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 500),
      ),
      navBarStyle:
          NavBarStyle.simple, // Choose the nav bar style with this property.
    );
  }

  PersistentBottomNavBarItem _navBarItem(
      BuildContext context, String iconAsset, String title) {
    double iconSize = 24;
    return PersistentBottomNavBarItem(
      textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
            fontFamily: GoogleFonts.rubik().fontFamily,
            fontSize: 12,
          ),
      icon: Image.asset(
        iconAsset,
        color: AppColors.whiteColor,
        height: iconSize,
        width: iconSize,
      ),
      inactiveIcon: Image.asset(
        iconAsset,
        color: AppColors.secondaryTextColor,
        height: iconSize,
        width: iconSize,
      ),
      title: title,
      activeColorPrimary: AppColors.whiteColor,
      inactiveColorPrimary: AppColors.inactiveColorNavBar,
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems(context) {
    return [
      _navBarItem(context, 'assets/icons/compass.png', L10n.exploreNavBar),
      _navBarItem(context, 'assets/icons/calendar_nav.png', L10n.eventsNavBar),
      _navBarItem(context, 'assets/icons/location_nav.png', L10n.mapNavBar),
      _navBarItem(context, 'assets/icons/profile_nav.png', L10n.profileNavBar),
    ];
  }
}

class Plug extends StatelessWidget {
  final int number;

  const Plug({Key? key, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'Screen $number',
        style: Theme.of(context).textTheme.displayMedium,
      )),
    );
  }
}

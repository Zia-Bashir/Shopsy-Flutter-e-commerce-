import 'package:flutter/material.dart';

import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:shopsy/src/screens/favourite/favourite_products_screen.dart';
import 'package:shopsy/src/screens/home/home_screen.dart';
import 'package:shopsy/src/screens/my%20account/my_account_screen.dart';
import 'package:shopsy/src/screens/profile/profile_screen.dart';
import 'package:shopsy/src/utils/app_colors.dart';
import 'package:shopsy/src/utils/my_icons_icons.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavBarScreenState createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _selectedIndex = 0;

  List pages = [
    const HomeScreen(),
    const FavouriteProductsScreen(),
    Container(),
    const MyAccountScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: FlashyTabBar(
        animationCurve: Curves.linear,
        selectedIndex: _selectedIndex,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
              icon: const Icon(MyIcons.shop_icon),
              title: Text(
                'Home',
                style: Theme.of(context).textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.w800, color: AppColors.mainColor),
              ),
              activeColor: AppColors.mainColor,
              inactiveColor: AppColors.secondaryColor),
          FlashyTabBarItem(
              icon: const Icon(MyIcons.heart_icon),
              title: Text(
                'Favourite',
                style: Theme.of(context).textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.w800, color: AppColors.mainColor),
              ),
              activeColor: AppColors.mainColor,
              inactiveColor: AppColors.secondaryColor),
          FlashyTabBarItem(
              icon: const Icon(MyIcons.chat_bubble_icon),
              title: Text(
                'Chat',
                style: Theme.of(context).textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.w800, color: AppColors.mainColor),
              ),
              activeColor: AppColors.mainColor,
              inactiveColor: AppColors.secondaryColor),
          FlashyTabBarItem(
              icon: const Icon(MyIcons.user_icon),
              title: Text(
                'Profile',
                style: Theme.of(context).textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.w800, color: AppColors.mainColor),
              ),
              activeColor: AppColors.mainColor,
              inactiveColor: AppColors.secondaryColor),
        ],
      ),
    );
  }
}

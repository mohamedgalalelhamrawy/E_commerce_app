import 'package:e_commerce_app/core/components/bottonnavitem.dart';
import 'package:e_commerce_app/core/resources/appcolors.dart';
import 'package:e_commerce_app/core/resources/assets-manager.dart';
import 'package:e_commerce_app/features/mainlayout/cart/cart.dart';
import 'package:e_commerce_app/features/mainlayout/home.dart/home.dart';
import 'package:e_commerce_app/features/mainlayout/profile/profile.dart';
import 'package:e_commerce_app/features/mainlayout/proudcts/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Mainlayout extends StatefulWidget {
  Mainlayout({super.key});

  @override
  State<Mainlayout> createState() => _MainlayoutState();
}

class _MainlayoutState extends State<Mainlayout> {
  int selectedIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    ProuductsScreen(),
    CartScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.r), topRight: Radius.circular(15.r)),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: selectedIndex,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            backgroundColor: Appcolors.Primary,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: BottonNavItem(
                    icon: AppAssets.iconHome,
                    isSelected: selectedIndex == 0,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: BottonNavItem(
                      icon: AppAssets.iconCategory,
                      isSelected: selectedIndex == 1),
                  label: ''),
              BottomNavigationBarItem(
                  icon: BottonNavItem(
                      icon: AppAssets.iconFavorites,
                      isSelected: selectedIndex == 2),
                  label: ''),
              BottomNavigationBarItem(
                  icon: BottonNavItem(
                      icon: AppAssets.iconProfile,
                      isSelected: selectedIndex == 3),
                  label: ''),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: SvgPicture.asset(
          AppAssets.routeLogoSvg,
          width: 66.w,
          height: 22.h,
        ),
      ),
      body: screens[selectedIndex],
    );
  }
}

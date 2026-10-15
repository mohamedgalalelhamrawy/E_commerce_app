
import 'package:e_commerce_app/core/route-manager/routes.dart';
import 'package:e_commerce_app/features/mainlayout/cubit/cubit/main_layout_cubit.dart';
import 'package:e_commerce_app/features/mainlayout/widgets/bottonnavitem.dart';
import 'package:e_commerce_app/core/resources/appcolors.dart';
import 'package:e_commerce_app/core/resources/assets-manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Mainlayout extends StatelessWidget {
  Mainlayout({super.key});

  var viewmodel = MainLayoutCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainLayoutCubit, MainLayoutState>(
      bloc: viewmodel,
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: MediaQuery.removePadding(
            context: context,
            removeBottom: true,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  topRight: Radius.circular(15.r)),
              child: BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                currentIndex: viewmodel.selectedIndex,
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                backgroundColor: Appcolors.Primary,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white70,
                onTap: (index) {
                 viewmodel.changeSelectedIndex(index);
                },
                items: [
                  BottomNavigationBarItem(
                      icon: BottonNavItem(
                        icon: AppAssets.iconHome,
                        isSelected: viewmodel.selectedIndex == 0,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: BottonNavItem(
                          icon: AppAssets.iconCategory,
                          isSelected: viewmodel.selectedIndex == 1),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: BottonNavItem(
                          icon: AppAssets.iconFavorites,
                          isSelected: viewmodel.selectedIndex == 2),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: BottonNavItem(
                          icon: AppAssets.iconProfile,
                          isSelected: viewmodel.selectedIndex == 3),
                      label: ''),
                ],
              ),
            ),
          ),
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.cartShopscreen);
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    size: 24.sp,
                    color: Appcolors.Primary,
                  ))
            ],
            scrolledUnderElevation: 0,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: SvgPicture.asset(
              AppAssets.routeLogoSvg,
              width: 66.w,
              height: 22.h,
            ),
          ),
          body: viewmodel.screens[viewmodel.selectedIndex],
        );
      },
    );
  }
}

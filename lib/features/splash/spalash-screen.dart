import 'dart:ui';

import 'package:e_commerce_app/core/resources/appcolors.dart';
import 'package:e_commerce_app/core/resources/assets-manager.dart';
import 'package:e_commerce_app/core/route-manager/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      if (!context.mounted) return; // حماية للـ context
      Navigator.pushReplacementNamed(context,Routes.loginScreen);
    });
    return Scaffold(
      backgroundColor: Appcolors.Primary,
      body: Stack(children: [
        Positioned(
          // bottom: 457,
          top: -457.h,
          width: 430.h,
          child: Container(
            height: (457 + 457).h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          // bottom: 457,
          bottom: -457.h,
          width: 430.h,
          child: Container(
            height: (457 + 457).h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 75.w),
            child: Image.asset(
              width: 430,
              AppAssets.routeLogo,
              color: Colors.white, // 👈 اللون اللي محتاجه
              colorBlendMode: BlendMode.srcIn,
            ),
          ),
        )
      ]),
    );
  }
}

import 'package:e_commerce_app/core/resources/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BottonNavItem extends StatelessWidget {
  const  BottonNavItem ({super.key, required this.icon,this.isSelected =false });
  final  bool isSelected ;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container( 
      height: 40.h,
      width: 40.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? Colors.white : Colors.transparent
      ),
      child: Center(
        child: SvgPicture.asset(
          icon ,
          colorFilter: ColorFilter.mode(
          isSelected ? Appcolors.Primary : Colors.white, 
          BlendMode.srcIn,
        ),
        width: 40.w,
        height: 40.h,
        ),
      ),
    );
  }
}
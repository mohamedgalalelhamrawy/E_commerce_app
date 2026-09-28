import 'package:e_commerce_app/core/resources/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle getTextStyle(
    {Color? color, FontWeight? fontWeight, double? fontSize}) {
  return TextStyle(color: color, fontWeight: fontWeight, fontSize: fontSize);
}

class Appstyles {
  static TextStyle authMainHeaders1 = TextStyle(
      color: Colors.white, 
      fontSize: 24.sp, 
      fontWeight: FontWeight.w600);
  static TextStyle subAuthMainHeaders1 = TextStyle(
      color: Colors.white, 
      fontSize: 16.sp, 
      fontWeight: FontWeight.w300);
  static TextStyle authHeaders = TextStyle(
      color: Colors.white,
      fontSize: 18.sp, 
      fontWeight: FontWeight.w500);
  static TextStyle hintAuthTextfield = TextStyle(
      color: Colors.black.withOpacity(0.7),
      fontSize: 20.sp,
      fontWeight: FontWeight.w300,);
  static TextStyle buttonAuth = TextStyle(
      color: Appcolors.Primary, fontSize: 24.sp, fontWeight: FontWeight.bold);
  static TextStyle homeLabels = TextStyle(
      color: Appcolors.darkPrimary,
      fontSize: 24.sp,
      fontWeight: FontWeight.w500);
  static TextStyle hometexts = TextStyle(
      color: Appcolors.darkPrimary,
      fontSize: 18.sp,
      fontWeight: FontWeight.w400);
  static TextStyle font14darkprimary = TextStyle(
      color: Appcolors.darkPrimary,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400);
  static TextStyle font16darkprimary = TextStyle(
      color: Appcolors.darkPrimary,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400);
  static TextStyle underLinePrice = TextStyle(
      decoration: TextDecoration.lineThrough,
      fontSize: 14.sp,
      color: Appcolors.opacityblue,
      fontWeight: FontWeight.w500);
  static TextStyle font20darkprimaryBold = TextStyle(
      color: Appcolors.darkPrimary,
      fontSize: 20.sp,
      fontWeight: FontWeight.w500);   
  static TextStyle font18darkprimaryBold = TextStyle(
      color: Appcolors.darkPrimary,
      fontSize: 18.sp,
      fontWeight: FontWeight.w500); 
  static TextStyle font14darkprimaryBold = TextStyle(
      color: Appcolors.darkPrimary,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500);
  static TextStyle font20WhiteBold = TextStyle(
      color: Colors.white,
      fontSize: 20.sp,
      fontWeight: FontWeight.w500);
  static TextStyle font14WhiteBold = TextStyle(
      color: Colors.white,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500);                       
}

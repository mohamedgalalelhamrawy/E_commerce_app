import 'package:e_commerce_app/core/resources/appcolors.dart';
import 'package:e_commerce_app/core/resources/appstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text});
    final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
              width: double.infinity, 
              height: 64.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  text ,
                  style: getTextStyle(
                    color: Appcolors.Primary,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            );
  }
}
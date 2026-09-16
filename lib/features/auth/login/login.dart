import 'package:e_commerce_app/core/components/customtextfield.dart';
import 'package:e_commerce_app/core/resources/appcolors.dart';
import 'package:e_commerce_app/core/resources/appstyles.dart';
import 'package:e_commerce_app/core/resources/assets-manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.Primary,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 109.h,
            ),
            Center(
              child: Image.asset(
                height: 71.h,
                width: 237.w,
                AppAssets.routeLogo,
                color: Colors.white, // 👈 اللون اللي محتاجه
              ),
            ),
            SizedBox(
              height: 109.h,
            ),
           
           CustomTextField( hint: "enter your name", obscureText:false, )
          ],
        ),
      ),
    );
  }
}

import 'package:e_commerce_app/core/components/custombutton.dart';
import 'package:e_commerce_app/core/components/customtextfield.dart';
import 'package:e_commerce_app/core/resources/constants.dart';
import 'package:e_commerce_app/core/resources/appcolors.dart';
import 'package:e_commerce_app/core/resources/appstyles.dart';
import 'package:e_commerce_app/core/resources/assets-manager.dart';
import 'package:e_commerce_app/core/route-manager/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

bool obscure = true;

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.Primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 109.h,
              ),
              Center(
                child: Image.asset(
                  height: 71.h,
                  width: 237.w,
                  AppAssets.routeLogo,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 79.h,
              ),
              //////////////////////////////////////////
              Text(
                Constants.welcomeBack,
                style: getTextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                Constants.pleaseSignIn,
                style: getTextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 40.h,
              ),
              ////////////////////////////////////////
              Text(
                Constants.userName,
                style: getTextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomTextField(
                hint: Constants.enterYourName,
                obscureText: false,
              ),
              SizedBox(
                height: 32.h,
              ),
              //////////////////////////////////////
              Text(
                Constants.password,
                style: getTextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomTextField(
                hint: Constants.enterYourPassword,
                obscureText: obscure,
                suffexicon: IconButton(
                  icon: obscure
                      ? Icon(Icons.visibility_off_outlined)
                      : Icon(Icons.visibility_outlined),
                  onPressed: () {
                    setState(() {
                      obscure = !obscure;
                    });
                  },
                ),
              ),
              //////////////////////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      Constants.forgotPassword,
                      style: getTextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 56.h,
              ),
              CustomButton(
                onpressed: (){
                  Navigator.pushNamed(context, Routes.mainlayoutSCreen);
                },
                text: Constants.login),
              SizedBox(
                height: 32.h,
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.signUpScreen);
                  },
                  child: Text(
                    Constants.dontHaveAccount,
                    style: getTextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:e_commerce_app/core/di/service_locator.dart';
import 'package:e_commerce_app/core/resources/appvalidate.dart';
import 'package:e_commerce_app/core/utils/dialogutils.dart';
import 'package:e_commerce_app/features/auth/cubit/cubit/auth_cubit.dart';
import 'package:e_commerce_app/features/auth/widgets/custombutton.dart';
import 'package:e_commerce_app/features/auth/widgets/customtextfield.dart';
import 'package:e_commerce_app/core/resources/constants.dart';
import 'package:e_commerce_app/core/resources/appcolors.dart';
import 'package:e_commerce_app/core/resources/appstyles.dart';
import 'package:e_commerce_app/core/resources/assets-manager.dart';
import 'package:e_commerce_app/core/route-manager/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

bool obscure = true;

class _LoginScreenState extends State<LoginScreen> {
  var viewmodel = sl<RegisterCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      bloc:viewmodel ,
      listener: (context, state) {
        if(state is LogInLoadingState){
          DialogUtils.showLoading(context: context, message: "...loading");
        }else if(state is LogInErrorState){
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context: context, message: state.failures.errmessage,posActionTitle: "ok",title: "Error");
        }else if(state is LogInSuccessState){
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context: context, message: "login Successfully",posActionTitle: "ok",title: "success",
          posAction: () {
            Navigator.pushReplacementNamed(context, Routes.mainlayoutSCreen);
          },
          );
        }
      },
      child: Scaffold(
          backgroundColor: Appcolors.Primary,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Form(
                key: viewmodel.loginFormKey,
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
                    Text(Constants.welcomeBack, style: Appstyles.authMainHeaders1),
                    Text(Constants.pleaseSignIn,
                        style: Appstyles.subAuthMainHeaders1),
                    SizedBox(
                      height: 40.h,
                    ),
                    ////////////////////////////////////////
                    Text(Constants.emailaddress, style: Appstyles.authHeaders),
                    SizedBox(
                      height: 24.h,
                    ),
                    CustomTextField(
                      controller: viewmodel.emailcontroller,
                      validator: Appvalidate.validateEmail,
                      hint: Constants.enterYourEmailAdress,
                      obscureText: false,
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    //////////////////////////////////////
                    Text(
                      Constants.password,
                      style: Appstyles.authHeaders,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    CustomTextField(
                      controller:viewmodel.passwordcontroller,
                      validator: Appvalidate.validatePassword,
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
                        onpressed: () {
                          if (viewmodel.loginFormKey.currentState!.validate() == true) {
                            viewmodel.logIn();
                          }
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
                        child: Text(Constants.dontHaveAccount,
                            style: Appstyles.authHeaders),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}

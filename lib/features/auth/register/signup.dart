import 'package:e_commerce_app/core/di/service_locator.dart';
import 'package:e_commerce_app/core/resources/appvalidate.dart';
import 'package:e_commerce_app/core/utils/dialogutils.dart';
import 'package:e_commerce_app/features/auth/cubit/cubit/auth_cubit.dart';
import 'package:e_commerce_app/features/auth/widgets/custombutton.dart';
import 'package:e_commerce_app/features/auth/widgets/customtextfield.dart';
import 'package:e_commerce_app/core/resources/appcolors.dart';
import 'package:e_commerce_app/core/resources/appstyles.dart';
import 'package:e_commerce_app/core/resources/assets-manager.dart';
import 'package:e_commerce_app/core/resources/constants.dart';
import 'package:e_commerce_app/core/route-manager/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class SignUp extends StatelessWidget {
SignUp({super.key});

  var viewmodel = sl<RegisterCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      bloc: viewmodel,
      listener: (context, state) {
        if(state is RegisterLoadingState){
          DialogUtils.showLoading(context: context, message: "...loading");
        }else if(state is RegisterErrorState){
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context: context, message: state.failures.errmessage,posActionTitle: "ok",title: "Error");
        }else if(state is RegisterSuccessState){
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context: context, message: "Register Successfully",posActionTitle: "ok",title: "success");
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Appcolors.Primary,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Form(
                key: viewmodel.formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 85.h,
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
                      height: 47.h,
                    ),
                    ////////////////////////////////////////////// full name
                    Text(
                      Constants.fullName,
                      style: Appstyles.authHeaders,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    CustomTextField(
                      controller: viewmodel.namecontroller,
                      validator: Appvalidate.validateName,
                      hint: Constants.enterYourFullName,
                      obscureText: false,
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    ///////////////////////////////////////////// mobile number
                    Text(
                      Constants.mobileNumber,
                      style: Appstyles.authHeaders,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    CustomTextField(
                      validator: Appvalidate.validatePhone,
                      controller: viewmodel.phonecontroller,
                      textInputType: TextInputType.number,
                      hint: Constants.enterYourMobileNo,
                      obscureText: false,
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    ///////////////////////////////////////////////// E-mail address
                    Text(Constants.emailaddress,
                        style: Appstyles.authHeaders),
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
                    //////////////////////////////////////////////// password
                    Text(Constants.password, style: Appstyles.authHeaders),
                    SizedBox(
                      height: 24.h,
                    ),
                    CustomTextField(
                      controller: viewmodel.passwordcontroller,
                      validator: Appvalidate.validatePassword,
                      hint: Constants.enterYourPassword,
                      obscureText: viewmodel.isobsecure,
                      suffexicon: IconButton(
                        icon: viewmodel.isobsecure
                            ? Icon(Icons.visibility_off_outlined)
                            : Icon(Icons.visibility_outlined),
                        onPressed: () {
                          viewmodel.changepasswordobsecure();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    //////////////////////////////////////////////
                    SizedBox(
                      height: 32.h,
                    ),
                    CustomButton(
                        onpressed: () {
                          if (viewmodel.formkey.currentState!.validate() ==
                              true) {
                            viewmodel.register();
                          }
                        },
                        text: Constants.signup),
                    /////////////////////////////////////////
                    SizedBox(
                      height: 16.h,
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.loginScreen);
                        },
                        child: Text(Constants.alreadyHaveAccount,
                            style: Appstyles.authHeaders),
                      ),
                    ),
                    SizedBox(height: 24.h)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

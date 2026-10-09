import 'package:e_commerce_app/core/resources/appvalidate.dart';
import 'package:e_commerce_app/features/auth/widgets/custombutton.dart';
import 'package:e_commerce_app/features/auth/widgets/customtextfield.dart';
import 'package:e_commerce_app/core/resources/appcolors.dart';
import 'package:e_commerce_app/core/resources/appstyles.dart';
import 'package:e_commerce_app/core/resources/assets-manager.dart';
import 'package:e_commerce_app/core/resources/constants.dart';
import 'package:e_commerce_app/core/route-manager/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

bool obscure = true;

class _SignUpState extends State<SignUp> {
  var emailcontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var namecontroller = TextEditingController();

  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.Primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Form(
            key: formkey,
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
                  controller: namecontroller,
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
                  controller: phonecontroller,
                  textInputType: TextInputType.number,
                  hint: Constants.enterYourMobileNo,
                  obscureText: false,
                ),
                SizedBox(
                  height: 32.h,
                ),
                ///////////////////////////////////////////////// E-mail address
                Text(Constants.emailaddress, style: Appstyles.authHeaders),
                SizedBox(
                  height: 24.h,
                ),
                CustomTextField(
                  controller: emailcontroller,
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
                  controller: passwordcontroller,
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
                SizedBox(
                  height: 32.h,
                ),
                //////////////////////////////////////////////
                SizedBox(
                  height: 32.h,
                ),
                CustomButton(
                    onpressed: () {
                      if (formkey.currentState!.validate()) {
                        print("good");
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
  }
}

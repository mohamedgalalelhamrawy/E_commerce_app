import 'package:e_commerce_app/core/resources/appcolors.dart';
import 'package:e_commerce_app/core/resources/appstyles.dart';
import 'package:e_commerce_app/core/sharedprefrence/sharedprefrence.dart';
import 'package:e_commerce_app/features/mainlayout/profile/widgets/profiletextfeilditem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("Welcome,${SharedPreferencesUtils.getdata(key: 'name')}",style:  Appstyles.font18darkprimaryBold,),
          SizedBox(height: 8.h,),
          Text("${SharedPreferencesUtils.getdata(key:'email')}",style: getTextStyle( 
            color: Appcolors.opacityDarkblue,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500
          ),),
          SizedBox(height: 40.h,),
          ProfileTextFeild(value: "${SharedPreferencesUtils.getdata(key: 'name')}", text: "Your full name"),
          ProfileTextFeild(value: "${SharedPreferencesUtils.getdata(key:'email')}", text: "Your E-mail"),
          ProfileTextFeild(value: "not available", text: "Your password",obscuretext: false,ispassword: true,),
          ProfileTextFeild(value: "not available", text: "Your mobile number"),
          ProfileTextFeild(value: "not available", text: "Your Address"),
        ],),
      ),
    );
  }
}
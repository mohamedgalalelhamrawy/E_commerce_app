import 'package:e_commerce_app/core/resources/appcolors.dart';
import 'package:e_commerce_app/core/resources/appstyles.dart';
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
          Text("Welcome, Mohamed",style:  Appstyles.font18darkprimaryBold,),
          SizedBox(height: 8.h,),
          Text("mohamed.G@gmail.com",style: getTextStyle( 
            color: Appcolors.opacityDarkblue,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500
          ),),
          SizedBox(height: 40.h,),
          ProfileTextFeild(value: "mohamed galal", text: "Your full name"),
          ProfileTextFeild(value: "mohamed.G@gmail.com", text: "Your E-mail"),
          ProfileTextFeild(value: "123456789", text: "Your password",obscuretext: true,ispassword: true,),
          ProfileTextFeild(value: "01624587734", text: "Your mobile number"),
          ProfileTextFeild(value: "egypt , gharbya , tanta , omar ebn elkhatab street next to etisalat compony", text: "Your Address"),
        ],),
      ),
    );
  }
}
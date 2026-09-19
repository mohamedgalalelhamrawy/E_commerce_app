import 'package:e_commerce_app/core/resources/appstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.controller,
      this.validator,
      this.suffexicon,
      this.hint,
      this.obscureText,
      this.textInputType});
  TextEditingController? controller;
  String? Function(String?)? validator;
  Widget? suffexicon;
  String? hint;
  bool? obscureText;
  TextInputType? textInputType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      controller: controller,
      validator: validator,
      style: TextStyle(fontSize: 22.sp, color: Colors.black),
      obscureText: obscureText ?? true,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        isDense: false,
        suffixIcon: suffexicon,
        hint: Text(hint ?? ""),
        hintStyle: getTextStyle(
          color: Colors.grey,
          fontSize: 20.sp,
          fontWeight: FontWeight.w300,
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 16),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide.none),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide.none),
      ),
    );
  }
}

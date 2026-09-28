import 'package:e_commerce_app/core/resources/appcolors.dart';
import 'package:e_commerce_app/core/resources/appstyles.dart';
import 'package:e_commerce_app/features/auth/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTextFeild extends StatefulWidget {
  ProfileTextFeild(
      {super.key,
      required this.value,
      required this.text,
      this.obscuretext = false,
      this.ispassword = false});
  bool obscuretext;
  final String value;
  final String text;
  final bool ispassword;

  @override
  State<ProfileTextFeild> createState() => _ProfileTextFeildState();
}

class _ProfileTextFeildState extends State<ProfileTextFeild> {
  bool isReadOnly = true;
  final FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.text,
          style: getTextStyle(
              color: Appcolors.darkPrimary,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 16.h,
        ),
        TextFormField(
          scrollPadding: EdgeInsets.zero, // 👈 يمنع السكرول الداخلي
          clipBehavior: Clip.hardEdge,
          maxLines: 1,
          style: getTextStyle(
                  color: Appcolors.darkPrimary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500)
              .copyWith(
            overflow: TextOverflow.ellipsis,
          ),
          focusNode: passwordFocusNode,
          obscuringCharacter: '*',
          obscureText: widget.obscuretext,
          initialValue: widget.value,
          readOnly: isReadOnly,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(color: Appcolors.opacityblue),
            ),
            suffixIcon: IconButton(
              icon: const Icon(Icons.edit_outlined),
              onPressed: () {
                setState(() {
                  isReadOnly = !isReadOnly;
                  if (widget.ispassword) {
                    widget.obscuretext = !widget.obscuretext;
                  }
                });
                FocusScope.of(context).requestFocus(passwordFocusNode);
              },
            ),
          ),
        ),
        SizedBox(
          height: 24.h,
        )
      ],
    );
  }
}

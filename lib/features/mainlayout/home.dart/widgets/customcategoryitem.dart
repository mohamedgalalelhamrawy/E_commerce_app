import 'package:e_commerce_app/core/resources/appcolors.dart';
import 'package:e_commerce_app/core/resources/appstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCategoryItem extends StatelessWidget {
  CustomCategoryItem({super.key, required this.imagepath, required this.text});
  String imagepath;
  String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(imagepath),
              fit: BoxFit.cover,
            ),
          ),
        )),
        Padding(
          padding: EdgeInsets.only(top: 6.h),
          child: Text(
            text,
            style: getTextStyle(color: Appcolors.Primary, fontSize: 18.sp),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}

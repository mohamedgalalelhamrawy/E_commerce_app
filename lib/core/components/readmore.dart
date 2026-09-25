 
 import 'package:e_commerce_app/core/resources/appcolors.dart';
import 'package:e_commerce_app/core/resources/appstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore_flutter/readmore_flutter.dart';

class CustomReadMore extends StatefulWidget {
  const CustomReadMore({super.key,required this.text});
  final String text;
  @override
  State<CustomReadMore> createState() => _CustomReadMoreState();
}

class _CustomReadMoreState extends State<CustomReadMore> {
  @override
  Widget build(BuildContext context) {
    return ReadMore(
            widget.text   ,
              style: getTextStyle(
                  color: Appcolors.Primary.withOpacity(0.6),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
              minLines: 3,
              readMoreText: 'Read more',
              readLessText: 'Read less',
              readMoreStyle: TextStyle(
                  color: Appcolors.Primary, fontWeight: FontWeight.bold),
              readMoreIconVisible: true,
              readMoreIcon: Icons.keyboard_arrow_down,
              readLessIcon: Icons.keyboard_arrow_up,
              iconSize: 20.r,
              alignCenter: false,
            );;
  }
}
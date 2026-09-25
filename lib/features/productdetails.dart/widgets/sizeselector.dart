import 'package:e_commerce_app/core/resources/appcolors.dart';
import 'package:e_commerce_app/core/resources/appstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Sizeselector extends StatefulWidget {
  const Sizeselector({super.key, required this.sizes, this.onSelectedSize});
  final List<String> sizes;
  final Function(String)? onSelectedSize;
  @override
  State<Sizeselector> createState() => _SizeselectorState();
}

class _SizeselectorState extends State<Sizeselector> {
  int selectedIndex = 0;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return  Row(
        children: List.generate(
          widget.sizes.length,
          (index) {
            isSelected = index == selectedIndex;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
                widget.onSelectedSize?.call(widget.sizes[index]);
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(right: 12.w),
                width: 35.r,
                height: 35.r,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? Appcolors.Primary : Colors.transparent),
                child: Text(
                  "${widget.sizes[index]}",
                  style: getTextStyle(
                      color: isSelected ? Colors.white : Appcolors.Primary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
            );
          },
        ),
      );
  }
}

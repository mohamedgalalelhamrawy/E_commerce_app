
import 'package:e_commerce_app/core/resources/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCounter extends StatelessWidget {
  final int count;
  final ValueChanged<int> onChanged;

  const ProductCounter({
    super.key,
    required this.count,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 6.h,
      ),
      decoration: BoxDecoration(
        color: Appcolors.Primary,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              if (count > 1) {
                onChanged(count - 1);
              }
            },
            child: Icon(
              Icons.remove_circle_outline,
              color: Colors.white,
              size: 20.sp,
            ),
          ),
          SizedBox(width: 12.w),
          Text(
            '$count',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 12.w),
          InkWell(
            onTap: () {
              onChanged(count + 1);
            },
            child: Icon(
              Icons.add_circle_outline,
              color: Colors.white,
              size: 20.sp,
            ),
          ),
        ],
      ),
    );
  }
}

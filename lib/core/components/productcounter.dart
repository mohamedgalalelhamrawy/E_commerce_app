import 'package:e_commerce_app/core/resources/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCounter extends StatefulWidget {
  final int initialValue;
  final ValueChanged<int>? onChanged;

  const ProductCounter({
    super.key,
    this.initialValue = 1,
    this.onChanged,
  });

  @override
  State<ProductCounter> createState() => _ProductCounterState();
}

class _ProductCounterState extends State<ProductCounter> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = widget.initialValue;
  }

  void _increment() {
    setState(() {
      count++;
    });
    widget.onChanged?.call(count);
  }

  void _decrement() {
    if (count > 1) {
      setState(() {
        count--;
      });
      widget.onChanged?.call(count);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Appcolors.Primary, // لون الفيجما الكحلي
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // زرار ينقص (-)
          InkWell(
            onTap: _decrement,
            child: Icon(
              Icons.remove_circle_outline,
              color: Colors.white,
              size: 20.sp,
            ),
          ),
          
          SizedBox(width: 12.w),
          
          // الرقم في النص
          Text(
            '$count',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          
          SizedBox(width: 12.w),
          
          // زرار يزود (+)
          InkWell(
            onTap: _increment,
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
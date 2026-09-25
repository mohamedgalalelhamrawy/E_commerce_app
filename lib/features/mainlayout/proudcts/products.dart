import 'package:e_commerce_app/core/components/customproductsitem.dart';
import 'package:e_commerce_app/core/route-manager/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProuductsScreen extends StatelessWidget {
  const ProuductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Container(
        child: GridView.builder(
          itemCount: 20,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 16.w,mainAxisSpacing: 16,childAspectRatio :0.81),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.productDetailsScreen);
                },
                child:  Customproductsitem(),
              );
            },),
      ),
    );
  }
}

import 'package:e_commerce_app/core/resources/appcolors.dart';
import 'package:e_commerce_app/core/resources/appstyles.dart';
import 'package:e_commerce_app/domain/entities/get_all_gategories_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCategoryOrBrandItem extends StatelessWidget {
  CustomCategoryOrBrandItem({super.key, required this.category});
   CategoryOrBrandResponseEntity category ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(category.image ?? ""),
              fit: BoxFit.cover,
            ),
          ),
        )),
        Padding(
          padding: EdgeInsets.only(top: 6.h),
          child: Text(
          category.name ?? "",
            style: Appstyles.hometexts,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}

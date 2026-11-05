import 'package:e_commerce_app/core/components/productcounter.dart';
import 'package:e_commerce_app/core/resources/appcolors.dart';
import 'package:e_commerce_app/core/resources/appstyles.dart';
import 'package:e_commerce_app/domain/entities/get_all_products_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cartitem extends StatelessWidget {
  const Cartitem({super.key, required this.product});
  final ProductResponseEntity product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Container(
          height: 113.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(17.r)),
              border: Border.all(
                  width: 1, color: const Color.fromARGB(255, 203, 200, 200))),
          child: Row(
            children: [
              Container(
                width: 120.w,
                height: 113.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15.r)),
                  child: Image.network(
                    product.imageCover ?? "",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.title ?? "",
                            style: Appstyles.font18darkprimaryBold,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              child: Icon(Icons.delete),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 8.w),
                            width: 15.r,
                            height: 15.r,
                            decoration: BoxDecoration(
                                // color: color  ,
                                shape: BoxShape.circle),
                          ),
                          Text(
                            " Size: 45",
                            style: getTextStyle(
                                color: Appcolors.opacityblue,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.price.toString(),
                            style: Appstyles.font18darkprimaryBold,
                          ),
                          ProductCounter()
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}

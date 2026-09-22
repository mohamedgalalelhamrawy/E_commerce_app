import 'package:e_commerce_app/core/components/customcarouselslider.dart';
import 'package:e_commerce_app/core/components/productcounter.dart';
import 'package:e_commerce_app/core/resources/appcolors.dart';
import 'package:e_commerce_app/core/resources/appstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({super.key});
  List<String> networkList = [
    "https://api.cezma.cloud/storage/thumbnails/products/web/1724682831temp4833654890058354368.png",
    "https://api.cezma.cloud/storage/thumbnails/products/web/1724682840temp2545218499505083095.png",
    "https://api.cezma.cloud/storage/thumbnails/products/web/1724682840temp7707597972883286266.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Product Details",
          style: getTextStyle(
              color: Appcolors.darkPrimary,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Container(
              child: CustomCarouselSlider(
                  height: 300.h, isNetwork: true, imgList: networkList),
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Nike Air Jordon",
                  style: getTextStyle(
                      color: Appcolors.darkPrimary,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "EGP 3,500",
                  style: getTextStyle(
                      color: Appcolors.darkPrimary,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  margin: EdgeInsets.only(right: 16.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(width: 1.r, color: Colors.grey)),
                  child: Text(
                    "3,230 Sold",
                    style: getTextStyle(
                        color: Appcolors.darkPrimary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                SizedBox(
                  width: 4.w,
                ),
                Text(
                  "4.8 (7,500)",
                  style: getTextStyle(
                      color: Appcolors.darkPrimary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
                Spacer(),
                ProductCounter(
                  initialValue: 1,
                  onChanged: (newCount) {
                    // قيمة الـ count الجديدة لما يزيد أو ينقص
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

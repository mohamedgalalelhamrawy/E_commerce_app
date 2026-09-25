import 'package:e_commerce_app/core/components/customcarouselslider.dart';
import 'package:e_commerce_app/features/mainlayout/home.dart/widgets/customcategoryitem.dart';
import 'package:e_commerce_app/core/resources/appcolors.dart';
import 'package:e_commerce_app/core/resources/appstyles.dart';
import 'package:e_commerce_app/core/resources/assets-manager.dart';
import 'package:e_commerce_app/core/resources/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  List<String> advsList = [AppAssets.adv1, AppAssets.adv2, AppAssets.adv3];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCarouselSlider(height: 200.h,imgList: advsList),
            SizedBox(
              height: 16.h,
            ),
            Text(
              Constants.categories,
              style: getTextStyle(
                  color: Appcolors.darkPrimary,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 12.h,
            ),
            SizedBox(
              height: 250,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16, // المسافة الأفقية بين العمود والعمود
                  crossAxisSpacing: 16, // المسافة الرأسية بين الصف والصف
                  // childAspectRatio: 1.2, // نسبة العرض للارتفاع لكل كارت
                ),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return CustomCategoryItem(
                    imagepath:
                        "https://img.pikbest.com/ai/illus_our/20230423/661db66aa04ece00dc8483c325c68142.jpg!bw800",
                    text: "katkot fashion",
                  );
                },
              ),
            ),
            ///////////////////////////////////////////////////////
             SizedBox(
              height: 16.h,
            ),
            Text(
              Constants.brands,
              style: getTextStyle(
                  color: Appcolors.darkPrimary,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 12.h,
            ),
            SizedBox(
              height: 250,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16, // المسافة الأفقية بين العمود والعمود
                  crossAxisSpacing: 16, // المسافة الرأسية بين الصف والصف
                  // childAspectRatio: 1.2, // نسبة العرض للارتفاع لكل كارت
                ),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return CustomCategoryItem(
                    imagepath:
                        "https://img.pikbest.com/ai/illus_our/20230423/661db66aa04ece00dc8483c325c68142.jpg!bw800",
                    text: "katkot fashion ",
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

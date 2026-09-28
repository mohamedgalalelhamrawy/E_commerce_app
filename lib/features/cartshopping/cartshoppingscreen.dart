import 'package:e_commerce_app/core/resources/appcolors.dart';
import 'package:e_commerce_app/core/resources/appstyles.dart';
import 'package:e_commerce_app/features/cartshopping/widgets/cartitem.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cartshoppingscreen extends StatelessWidget {
  const Cartshoppingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Cart",
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
            Expanded(
              child: ListView.builder(
                itemCount:10,
                itemBuilder: (context, index) {
                  return Cartitem(
                    color: Colors.red,
                    img:
                        "https://www.divanostores.com/wp-content/uploads/2024/12/WhatsApp-Image-2024-12-22-at-1.24.21-PM.jpeg",
                    prodName: "Nike Air Jordon",
                    size: "41",
                    totalprice: "EGP 3,500",
                  );
                },
              ),
            ),
            SizedBox(
              height: 90,  
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "Total price",
                        style: getTextStyle(
                            color: Appcolors.Primary.withOpacity(0.6),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        "EGP 3,500",
                        style: getTextStyle(
                            color: Appcolors.darkPrimary,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Spacer(),
                  Container(
                    width: 270.w,
                    height: 48.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.w, vertical: 5.h),
                    decoration: BoxDecoration(
                        color: Appcolors.Primary,
                        borderRadius: BorderRadius.all(Radius.circular(20.r))),
                    child: Row(
                      children: [
                        Text(
                          "Check Out",
                          style: getTextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Icon(
                          Icons.arrow_right_alt,
                          color: Colors.white,
                          size: 21.sp,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

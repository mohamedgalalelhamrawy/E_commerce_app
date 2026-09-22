import 'package:e_commerce_app/core/resources/assets-manager.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/resources/appcolors.dart';
import 'package:e_commerce_app/core/resources/appstyles.dart';
import 'package:e_commerce_app/core/resources/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Customproductsitem extends StatefulWidget {
  Customproductsitem({super.key});

  @override
  State<Customproductsitem> createState() => _CustomproductsitemState();
}

class _CustomproductsitemState extends State<Customproductsitem> {
  bool isfavorite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2.r),
          borderRadius: BorderRadius.all(Radius.circular(15.r))),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            child: Stack(
              children: [
                Container(
                  height: 128.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://image.celine.com/asset/a1b1b7f5-86c8-466c-9e7c-35925e5c9af6/353143840C-01OK_1_SUM23.jpg?V3&im=Resize=(1200)"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  top: 8.h,
                  right: 8.w,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isfavorite = !isfavorite;
                      });
                    },
                    child: Container(
                      height: 32.h,
                      width: 32.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                          isfavorite
                              ? AppAssets.iconFavorites2
                              : AppAssets.iconFavorites,
                          height: 19.h,
                          width: 18.w,
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Appcolors.Primary, BlendMode.srcIn)),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.h, left: 8.w, right: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nike air jordon",
                    style: getTextStyle(
                        color: Appcolors.darkPrimary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400)),
                Text(
                    "Nike shoes for playing football with your friends at home",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: getTextStyle(
                        color: Appcolors.darkPrimary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    Text("EGP 1,100",
                        style: getTextStyle(
                            color: Appcolors.darkPrimary,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400)),
                    SizedBox(
                      width: 16.w,
                    ),
                    Text("EGP 1,500",
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 14.sp,
                            color: Appcolors.opacityblue,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(Constants.review,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Appcolors.darkPrimary,
                            )),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          child: Text("(4.5)",
                              style: TextStyle(
                                fontSize: 14,
                                color: Appcolors.darkPrimary,
                              )),
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                      ],
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(right: 2.w),
                        height: 32.h,
                        width: 32.w,
                        decoration: BoxDecoration(
                          color: Appcolors.Primary,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
    ;
  }
}

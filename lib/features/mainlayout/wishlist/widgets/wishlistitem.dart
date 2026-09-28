import 'package:e_commerce_app/core/resources/appcolors.dart';
import 'package:e_commerce_app/core/resources/appstyles.dart';
import 'package:e_commerce_app/core/resources/assets-manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class WishListItem extends StatefulWidget {
  const WishListItem(
      {super.key,
      this.favorite,
      required this.img,
      required this.prodName,
      required this.totalprice,
      required this.color});
  final VoidCallback? favorite;
  final String img;
  final String prodName;

  final String totalprice;
  final Color color;

  @override
  State<WishListItem> createState() => _WishListItemState();
}

class _WishListItemState extends State<WishListItem> {
  bool isfavorite = false;
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
                // height: 113.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15.r)),
                  child: Image.network(
                    widget.img,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(8.h),
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.prodName,
                            style: getTextStyle(
                                color: Appcolors.darkPrimary,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          GestureDetector(
                            onTap: widget.favorite,
                            child: Container(
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
                            ),
                          )
                        ],
                      ),
                    
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 8.w),
                            width: 15.r,
                            height: 15.r,
                            decoration: BoxDecoration(
                                color: widget.color, shape: BoxShape.circle),
                          ),
                          Text(
                            " Color",
                            style: getTextStyle(
                                color: widget.color,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            widget.totalprice,
                            style: getTextStyle(
                                color: Appcolors.darkPrimary,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: 8.w,),
                          Text("EGP 1,500",
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 11.sp,
                                  color: Appcolors.opacityblue,
                                  fontWeight: FontWeight.w500)),
                                  SizedBox(width: 10.w,),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                padding: EdgeInsets
                                    .zero, 
                                minimumSize: Size.zero,
                                backgroundColor: Appcolors.Primary,
                                fixedSize: Size(
                                    100.w, 26.h),
                              ),
                              onPressed: () {},
                              child: Text(
                                "Add to Cart",
                                style: getTextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
    ;
  }
}

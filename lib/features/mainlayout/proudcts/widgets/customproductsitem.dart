import 'package:e_commerce_app/core/resources/assets-manager.dart';
import 'package:e_commerce_app/domain/entities/get_all_products_entity.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/resources/appcolors.dart';
import 'package:e_commerce_app/core/resources/appstyles.dart';
import 'package:e_commerce_app/core/resources/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Customproductsitem extends StatefulWidget {
  Customproductsitem({super.key, required this.productResponseEntity});
  ProductResponseEntity productResponseEntity;
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
                          widget.productResponseEntity.imageCover ?? "الصورة"),
                      fit: BoxFit.cover,
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
                Text(widget.productResponseEntity.title ?? "title",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Appstyles.font14darkprimary),
                Text(widget.productResponseEntity.description ?? "description",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Appstyles.font14darkprimary),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    Text(
                        widget.productResponseEntity.priceAfterDiscount != null
                            ? widget.productResponseEntity.priceAfterDiscount
                                .toString()
                            : "new Price",
                        style: Appstyles.font16darkprimary),
                    SizedBox(
                      width: 16.w,
                    ),
                    Text(widget.productResponseEntity.price.toString(),
                        style: Appstyles.underLinePrice),
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
                            style: Appstyles.font14darkprimary),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          child: Text("(${widget.productResponseEntity.ratingsAverage.toString()})",
                              style: Appstyles.font14darkprimary),
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
  }
}

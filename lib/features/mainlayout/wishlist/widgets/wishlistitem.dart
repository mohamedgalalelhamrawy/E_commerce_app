import 'package:e_commerce_app/core/resources/appcolors.dart';
import 'package:e_commerce_app/core/resources/appstyles.dart';
import 'package:e_commerce_app/core/resources/assets-manager.dart';
import 'package:e_commerce_app/core/resources/constants.dart';
import 'package:e_commerce_app/domain/entities/get_all_products_entity.dart';
import 'package:e_commerce_app/features/cartshopping/cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/mainlayout/wishlist/cubit/wish_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class WishListItem extends StatelessWidget {
  const WishListItem(
      {super.key, this.favorite, required this.productResponseEntity});
  final VoidCallback? favorite;
  final ProductResponseEntity productResponseEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Container(
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
                    productResponseEntity.imageCover ?? "",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(8.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              productResponseEntity.title ?? '',
                              style: Appstyles.font18darkprimaryBold,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          GestureDetector(
                            onTap: favorite,
                            child: Container(
                              ////// el alb
                              child: BlocBuilder<WishListCubit, WishListState>(
                                builder: (context, state) {
                                  bool isFavorite = WishListCubit.get(context)
                                      .isFavorite(
                                          productResponseEntity.id!);
                                  return InkWell(
                                    onTap: () {
                                      if (isFavorite) {
                                         WishListCubit.get(context).removeProdFromWishList(productResponseEntity.id!);
                                      } else {
                                        WishListCubit.get(context)
                                            .addProductToWishlist(productResponseEntity.id!,productResponseEntity);
                                      }
                                    },
                                    child: Container(
                                      height: 32.h,
                                      width: 32.w,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: SvgPicture.asset(
                                          isFavorite
                                              ? AppAssets.iconFavorites2
                                              : AppAssets.iconFavorites,
                                          height: 19.h,
                                          width: 18.w,
                                          fit: BoxFit.cover,
                                          colorFilter: ColorFilter.mode(
                                              Appcolors.Primary,
                                              BlendMode.srcIn)),
                                    ),
                                  );
                                },
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
                                color: Colors.black, shape: BoxShape.circle),
                          ),
                          Text(
                            Constants.color,
                            style: getTextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            productResponseEntity.priceAfterDiscount ==
                                    null
                                ? productResponseEntity.price.toString()
                                : productResponseEntity.priceAfterDiscount
                                    .toString(),
                            style: Appstyles.font18darkprimaryBold,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                              productResponseEntity.priceAfterDiscount ==
                                      null
                                  ? ""
                                  : productResponseEntity.price
                                      .toString(),
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 11.sp,
                                  color: Appcolors.opacityblue,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(
                            width: 10.w,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                backgroundColor: Appcolors.Primary,
                                fixedSize: Size(100.w, 26.h),
                              ),
                              onPressed: () {
                                CartCubit.get(context).addProductToCart(productResponseEntity.id!);
                              },
                              child: Text(Constants.addtocart,
                                  style: Appstyles.font14WhiteBold))
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

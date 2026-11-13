import 'package:e_commerce_app/core/resources/appcolors.dart';
import 'package:e_commerce_app/core/resources/appstyles.dart';
import 'package:e_commerce_app/core/resources/constants.dart';
import 'package:e_commerce_app/core/utils/dialogutils.dart';
import 'package:e_commerce_app/features/cartshopping/cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/cartshopping/widgets/cartitem.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cartshoppingscreen extends StatefulWidget {
  const Cartshoppingscreen({super.key});

  @override
  State<Cartshoppingscreen> createState() => _CartshoppingscreenState();
}

class _CartshoppingscreenState extends State<Cartshoppingscreen> {
  @override
  void initState() {
    super.initState();
    CartCubit.get(context).getProductsOfCart();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listenWhen: (previous, current) {
        return current is UpdateCountOfproductCartErrorState||
        current is RemoveProductOfCartErrorState ||
        current is RemoveProductOfCartSuccessState;
      },
      listener: (context, state) {
        if (state is UpdateCountOfproductCartErrorState) {
          DialogUtils.showMessage(
              context: context, message: state.failures.errmessage);
        } else if (state is RemoveProductOfCartErrorState){
           DialogUtils.showMessage(
              context: context, message: state.failures.errmessage);
        } else if(state is RemoveProductOfCartSuccessState){
           DialogUtils.showMessage(
              context: context, message: state.getCartResponseEntity.message!);
        }
      },
      buildWhen: (previous, current) {
        return current is GetProductsOfCartErrorState ||
            current is GetProductsOfCartLoadingState ||
            current is GetProductsOfCartSuccessState;
      },
      builder: (context, state) {
        if (state is GetProductsOfCartLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetProductsOfCartErrorState) {
          return Center(
            child: Text(state.failures.errmessage),
          );
        } else if (state is GetProductsOfCartSuccessState) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                Constants.cart,
                style: Appstyles.font18darkprimaryBold,
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount:
                          state.getCartResponseEntity.data!.products!.length,
                      itemBuilder: (context, index) {
                        return Cartitem(
                          productElment: state
                              .getCartResponseEntity.data!.products![index],
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
                              Constants.totalPrice,
                              style: getTextStyle(
                                  color: Appcolors.Primary.withOpacity(0.6),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              "EGP ${state.getCartResponseEntity.data!.totalCartPrice.toString()}",
                              style: Appstyles.font18darkprimaryBold,
                            )
                          ],
                        ),
                        Spacer(),
                        Container(
                          width: 270.w,
                          height: 48.h,
                          padding: EdgeInsets.symmetric(
                              horizontal: 40.w, vertical: 5.h),
                          decoration: BoxDecoration(
                              color: Appcolors.Primary,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.r))),
                          child: Row(
                            children: [
                              Text(
                                Constants.checkOut,
                                style: Appstyles.font20WhiteBold,
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
        } else {
          return SizedBox();
        }
      },
    );
  }
}

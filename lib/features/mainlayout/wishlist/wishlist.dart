import 'package:e_commerce_app/features/cartshopping/cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/mainlayout/wishlist/cubit/wish_list_cubit.dart';
import 'package:e_commerce_app/features/mainlayout/wishlist/widgets/wishlistitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: BlocListener<CartCubit, CartState>(
        listener: (context, state) {
          
        },
        child: BlocBuilder<WishListCubit, WishListState>(
          builder: (context, state) {
            if (state is getProductsOfWishListSuccessState) {
              return ListView.builder(
                itemCount: state.getWishlistResponseEntity.data!.length,
                itemBuilder: (context, index) {
                  return WishListItem(
                      productResponseEntity:
                          state.getWishlistResponseEntity.data![index]);
                },
              );
            } else if (state is getProductsOfWishListErrorState) {
              return Center(
                child: Text(state.failures.errmessage),
              );
            } else if (state is getProductsOfWishListLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}

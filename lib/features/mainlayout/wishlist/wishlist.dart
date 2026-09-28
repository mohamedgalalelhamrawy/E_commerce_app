import 'package:e_commerce_app/features/mainlayout/wishlist/widgets/wishlistitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return WishListItem(
              img:
                  "https://img-1.kwcdn.com/product/fancy/886fb217-60df-47d9-bb28-1255d9f5fbab.jpg?imageView2/2/w/800/q/70/format/avif",
              prodName: "Nike Air Jordon",
              totalprice: "EGP 1,200",
              color: Colors.black);
        },
      ),
    );
  }
}

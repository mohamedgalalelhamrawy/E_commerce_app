import 'package:e_commerce_app/core/resources/constants.dart';
import 'package:e_commerce_app/domain/entities/get_all_products_entity.dart';
import 'package:e_commerce_app/features/productdetails.dart/widgets/colorselector.dart';
import 'package:e_commerce_app/core/components/customcarouselslider.dart';
import 'package:e_commerce_app/core/components/productcounter.dart';
import 'package:e_commerce_app/core/components/readmore.dart';
import 'package:e_commerce_app/features/productdetails.dart/widgets/sizeselector.dart';
import 'package:e_commerce_app/core/resources/appcolors.dart';
import 'package:e_commerce_app/core/resources/appstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}
class _ProductDetailsState extends State<ProductDetails> {
  int selectedQuantity = 1;

  @override
  Widget build(BuildContext context) {
    var product = ModalRoute.of(context)?.settings.arguments as ProductResponseEntity;
      var unitPrice = product.priceAfterDiscount ?? product.price ?? 0;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Product Details", style: Appstyles.font20darkprimaryBold),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: CustomCarouselSlider(
                    height: 300.h,
                    isNetwork: true,
                    imgList: product.images ?? []),
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      product.title ?? "",
                      style: Appstyles.font18darkprimaryBold,
                    ),
                  ),
                  Text( unitPrice.toString() ,
                    style: Appstyles.font18darkprimaryBold,
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
                    child: Text("${product.sold} Sold",
                        style: Appstyles.font14darkprimaryBold),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text("${product.ratingsAverage}(${product.ratingsQuantity})",
                      style: Appstyles.font14darkprimary),
                  Spacer(),
                  ProductCounter(
                    initialValue: 1,
                    onChanged: (newCount) {
                      setState(() {
                        selectedQuantity = newCount;
                      });
                    },
                  )
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                Constants.describtion,
                style: Appstyles.font18darkprimaryBold,
              ),
              SizedBox(
                height: 8.h,
              ),
              CustomReadMore(text: product.description ?? ""),
              SizedBox(
                height: 16.h,
              ),
              Text(
                Constants.size,
                style: Appstyles.font18darkprimaryBold,
              ),
              SizedBox(
                height: 8.h,
              ),
              Sizeselector(sizes: ["38", "39", "40", "41", "42"]),
              SizedBox(
                height: 16.h,
              ),
              Text(Constants.color, style: Appstyles.font18darkprimaryBold),
              SizedBox(
                height: 8.h,
              ),
              Colorselector(colorsList: product.availableColors ?? []),
              SizedBox(
                height: 48.h,
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
                        Text( "${selectedQuantity*unitPrice}",
                          style: Appstyles.font18darkprimaryBold,
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
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.r))),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add_shopping_cart,
                            color: Colors.white,
                            size: 21.sp,
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Text(
                            Constants.addtocart,
                            style: Appstyles.font20WhiteBold,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 24.h)
            ],
          ),
        ),
      ),
    );
  }
}

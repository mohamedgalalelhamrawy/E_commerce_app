
import 'package:e_commerce_app/core/components/customcarouselslider.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({super.key});
    List<String> networkList = [
      "https://api.cezma.cloud/storage/thumbnails/products/web/1724682831temp4833654890058354368.png",
      "https://api.cezma.cloud/storage/thumbnails/products/web/1724682840temp2545218499505083095.png",
      "https://api.cezma.cloud/storage/thumbnails/products/web/1724682840temp7707597972883286266.png"
    ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: CustomCarouselSlider(imgList: networkList),
        )
      ],
    );
  }
}

import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomCarouselSlider extends StatefulWidget {
final List<String> imgList ;

 CustomCarouselSlider({super.key, required this.imgList});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  // 1. المتغير اللي بيحفظ رقم الصورة الشغالة حالياً
  int activeIndex = 0; 

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // الـ Slider الرئيسي
        CarouselSlider.builder(
          itemCount: widget.imgList.length,
          itemBuilder: (context, index, realIndex) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                widget.imgList[index],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            );
          },
          options: CarouselOptions(
            height: 200,
            autoPlay: true, // يقلب لوحده
            viewportFraction: 1.0, // الصورة تاخد العرض كامل
            // 👈 هنا مربط الفرس: كل ما الصورة تتغير بنحدث الـ activeIndex
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
        ),

        // 2. مؤشر النقاط (Page Indicator)
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: AnimatedSmoothIndicator(
            activeIndex: activeIndex, // 👈 بنبصي له الرقم الحالي
            count: widget.imgList.length, // عدد الصور الإجمالي
            effect: const ExpandingDotsEffect( // شكل الأنيميشن والنقاط
              dotWidth: 8,
              dotHeight: 8,
              activeDotColor: Color(0xFF004182),
              dotColor: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
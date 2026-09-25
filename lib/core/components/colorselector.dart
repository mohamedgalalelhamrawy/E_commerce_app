 
 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Colorselector extends StatefulWidget {
   const Colorselector({super.key,required this.colorsList,this.onColorSelected});
     final List<Color> colorsList;
    final Function(Color)? onColorSelected ;
   @override
   State<Colorselector> createState() => _ColorselectorState();
 }
 
 class _ColorselectorState extends State<Colorselector> {
  int selectedIndex = 0 ;
  bool isSelected = false ;
   @override
   Widget build(BuildContext context) {
     return Container(
      child: Row(
        children: List.generate(
          widget.colorsList.length,
          (index) {
            isSelected = index == selectedIndex;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
                widget.onColorSelected?.call(widget.colorsList[index]);
              },
              child: Container(
                 alignment: Alignment.center,
                margin: EdgeInsets.only(right: 12.w),
               width:35.r ,
               height: 35.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.colorsList[index]
              ),
              child: isSelected ? Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 20.sp,
                      ) : null,
              ),
            );
          },
        ),
      ),
    );;
   }
 }
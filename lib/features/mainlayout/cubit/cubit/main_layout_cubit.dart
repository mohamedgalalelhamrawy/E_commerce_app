import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/mainlayout/home.dart/home.dart';
import 'package:e_commerce_app/features/mainlayout/profile/profile.dart';
import 'package:e_commerce_app/features/mainlayout/proudcts/products.dart';
import 'package:e_commerce_app/features/mainlayout/wishlist/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'main_layout_state.dart';

class MainLayoutCubit extends Cubit<MainLayoutState> {
  MainLayoutCubit() : super(MainLayoutInitial());

   int selectedIndex = 0;

   List<Widget> screens = [
    HomeScreen(),
    ProuductsScreen(),
    WishlistScreen (),
    ProfileScreen()
  ];

  void changeSelectedIndex(int newSelectedIndex){
      selectedIndex = newSelectedIndex; 
      emit(ChangeSelectedIndexState());
  }
}

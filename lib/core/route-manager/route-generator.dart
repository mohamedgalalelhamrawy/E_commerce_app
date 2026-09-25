import 'package:e_commerce_app/core/route-manager/routes.dart';
import 'package:e_commerce_app/features/auth/login/login.dart';
import 'package:e_commerce_app/features/auth/register/signup.dart';
import 'package:e_commerce_app/features/mainlayout/cart/cart.dart';
import 'package:e_commerce_app/features/mainlayout/mainlayout.dart';
import 'package:e_commerce_app/features/productdetails.dart/productdetails.dart';
import 'package:e_commerce_app/features/splash/spalash-screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic>? getRoute(RouteSettings settings) {
    switch(settings.name){
      case Routes.splashScreen : 
      return MaterialPageRoute(builder: (_) =>  SplashScreen()) ;
      case Routes.loginScreen : 
      return MaterialPageRoute(builder: (_) =>  LoginScreen()) ;
      case Routes.mainlayoutSCreen : 
      return MaterialPageRoute(builder: (_) =>  Mainlayout()) ;
      case Routes.signUpScreen :
      return MaterialPageRoute(builder: (_) => SignUp());
      case Routes.productDetailsScreen :
      return MaterialPageRoute(builder: (_) => ProductDetails());
      case Routes.cartscreen :
      return MaterialPageRoute(builder: (_) => CartScreen());
      default: undefinedRoute();
    }
  }
}

Route<dynamic> undefinedRoute (){
  return MaterialPageRoute(builder: (_) =>
  Scaffold(
    appBar: AppBar(
      title: Text("Undefined Route"),
    ),
  )
  );
}
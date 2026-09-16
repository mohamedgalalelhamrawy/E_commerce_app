import 'package:e_commerce_app/core/route-manager/routes.dart';
import 'package:e_commerce_app/features/auth/login/login.dart';
import 'package:e_commerce_app/features/mainlayout/mainlayout.dart';
import 'package:e_commerce_app/features/spalash-screen.dart';
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
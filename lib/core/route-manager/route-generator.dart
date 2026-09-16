import 'package:e_commerce_app/core/route-manager/routes.dart';
import 'package:e_commerce_app/features/spalash-screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic>? getRoute(RouteSettings settings) {
    switch(settings.name){
      case Routes.splashScreen : 
      return MaterialPageRoute(builder: (_) =>  SplashScreen()) ;
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
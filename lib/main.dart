import 'package:e_commerce_app/core/di/service_locator.dart';
import 'package:e_commerce_app/core/route-manager/route-generator.dart';
import 'package:e_commerce_app/core/route-manager/routes.dart';
import 'package:e_commerce_app/core/sharedprefrence/sharedprefrence.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesUtils.init();
  configureDependencies();
  var token = SharedPreferencesUtils.getdata(key:"token");
  String route;
  if(token == null){
    route = Routes.splashScreen;
  }else{
    route = Routes.mainlayoutSCreen;
  }
  runApp( MyApp( route: route ));
}

class MyApp extends StatelessWidget {
   const MyApp({super.key,required this.route});
   final String route;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute:route,
        );
      },
    );
  }
}

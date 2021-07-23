import 'package:app_crud/app/core/utils/dependecy_injection.dart';
import 'package:app_crud/app/modules/splash/splash_bingind.dart';
import 'package:app_crud/app/modules/splash/splash_page.dart';
import 'package:app_crud/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  DependecyInjection.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashPage(),
      initialBinding: SplashBiding(),
      getPages: AppPages.pages,
    );
  }
}

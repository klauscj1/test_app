import 'package:app_crud/app/modules/home/home_binding.dart';
import 'package:app_crud/app/modules/home/home_page.dart';
import 'package:app_crud/app/modules/login/login_binding.dart';
import 'package:app_crud/app/modules/login/login_page.dart';
import 'package:app_crud/app/modules/mascota/mascota_binding.dart';
import 'package:app_crud/app/modules/mascota/mascota_page.dart';
import 'package:app_crud/app/modules/splash/splash_bingind.dart';
import 'package:app_crud/app/modules/splash/splash_page.dart';
import 'package:app_crud/app/routes/app_routes.dart';
import 'package:get/route_manager.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBiding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.MASCOTA,
      page: () => MascotaPage(),
      binding: MascotaBinding(),
    ),
  ];
}

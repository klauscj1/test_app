import 'package:app_crud/app/modules/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}

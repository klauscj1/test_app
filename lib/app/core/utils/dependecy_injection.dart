import 'package:app_crud/app/data/provider/authentication_api.dart';
import 'package:app_crud/app/data/provider/mascotas_api.dart';
import 'package:app_crud/app/data/repository/authentication_respository.dart';
import 'package:app_crud/app/data/repository/mascotas_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DependecyInjection {
  static void init() {
    Get.lazyPut(
        () => Dio(BaseOptions(baseUrl: 'https://9d700ae3fbaf.ngrok.io')));
    Get.lazyPut(() => AuthenticationAPI());
    Get.lazyPut(() => AuthenticationRepository());
    Get.lazyPut(() => MascotasAPI());
    Get.lazyPut(() => MascotasRepository());
  }
}

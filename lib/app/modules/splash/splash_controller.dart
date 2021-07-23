import 'dart:convert';

import 'package:app_crud/app/data/model/login_response.dart';
import 'package:app_crud/app/routes/app_routes.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final storage = new FlutterSecureStorage();

  @override
  void onReady() {
    _navegar();
  }

  void _navegar() async {
    // await storage.deleteAll();
    await Future.delayed(Duration(seconds: 2));
    final usuario = await storage.read(key: 'usuario');
    if (usuario != null) {
      Map loginMap = jsonDecode(usuario);
      LoginResponse respuesta =
          LoginResponse.fromJson(loginMap.cast<String, dynamic>());

      Get.offNamed(AppRoutes.HOME, arguments: respuesta);
    } else {
      Get.offNamed(AppRoutes.LOGIN);
    }
  }
}

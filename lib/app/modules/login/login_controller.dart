import 'dart:convert';

import 'package:app_crud/app/data/model/login_response.dart';
import 'package:app_crud/app/data/repository/authentication_respository.dart';
import 'package:app_crud/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginController extends GetxController {
  final AuthenticationRepository _repository =
      Get.find<AuthenticationRepository>();

  String _correo = '';
  String _password = '';

  realizarLogin() async {
    try {
      LoginResponse respuesta =
          await _repository.login(correo: _correo, password: _password);

      final storage = new FlutterSecureStorage();
      storage.write(key: 'usuario', value: jsonEncode(respuesta.toJson()));
      Get.offNamed(AppRoutes.HOME, arguments: respuesta);
    } catch (e) {
      print(e);
      Get.showSnackbar(GetBar(
        title: 'Error',
        message: 'Correo o contraseña invalido',
        duration: Duration(seconds: 2),
        margin: EdgeInsets.symmetric(horizontal: 10),
      ));
    }
  }

  onChangeCorreo(String value) {
    _correo = value;
  }

  onChangePassword(String value) {
    _password = value;
  }
}

import 'package:app_crud/app/data/model/login_response.dart';
import 'package:dio/dio.dart' as diox;
import 'package:get/get.dart';

class AuthenticationAPI {
  final diox.Dio _dio = Get.find<diox.Dio>();

  Future<LoginResponse> login(
      {required String correo, required String password}) async {
    final diox.Response response = await _dio.post('/auth/local',
        data: {'identifier': correo, 'password': password});
    return LoginResponse.fromJson(response.data);
  }
}

import 'package:app_crud/app/data/model/login_response.dart';
import 'package:app_crud/app/data/provider/authentication_api.dart';
import 'package:get/instance_manager.dart';

class AuthenticationRepository {
  final AuthenticationAPI _api = Get.find<AuthenticationAPI>();

  Future<LoginResponse> login(
          {required String correo, required String password}) =>
      _api.login(correo: correo, password: password);
}

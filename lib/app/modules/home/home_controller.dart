import 'package:app_crud/app/data/model/login_response.dart';
import 'package:app_crud/app/data/model/mascota_model.dart';
import 'package:app_crud/app/data/model/mascotas_response.dart';
import 'package:app_crud/app/data/model/usuario_model.dart';
import 'package:app_crud/app/data/repository/mascotas_repository.dart';
import 'package:app_crud/app/routes/app_routes.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final MascotasRepository _repository = Get.find<MascotasRepository>();
  final storage = new FlutterSecureStorage();
  UsuarioModel usuario = UsuarioModel();
  String jwt = "";
  List<MascotaModel> mascotas = [];

  @override
  void onInit() {
    super.onInit();
    final LoginResponse argumento = Get.arguments;
    usuario = argumento.user!;
    jwt = argumento.jwt!;
    obtenerMascotas();
  }

  void obtenerMascotas() async {
    try {
      MascotaResponse respuesta =
          await _repository.getMascotas(usuario.id!, jwt);
      mascotas = respuesta.mascotas!;

      update(['mascotas']);
    } catch (e) {}
  }

  void navegarNuevaMascota() {
    Get.toNamed(AppRoutes.MASCOTA);
  }

  void navegarModificarMascota(MascotaModel mascota) {
    Get.toNamed(AppRoutes.MASCOTA, arguments: mascota);
  }

  void addMascota(MascotaModel mascota) {
    mascotas.add(mascota);
    update(['mascotas']);
  }

  void actualizarMascota(MascotaModel mascota) {
    mascotas = mascotas.map((e) {
      if (e.id != mascota.id) {
        return e;
      } else {
        return mascota;
      }
    }).toList();

    update(['mascotas']);
  }

  void eliminarMascota(MascotaModel mascota) {
    mascotas = mascotas.where((e) => e.id != mascota.id).toList();
    update(['mascotas']);
  }

  void cerrarSesion() async {
    await storage.deleteAll();
    Get.offNamed(AppRoutes.LOGIN);
  }
}

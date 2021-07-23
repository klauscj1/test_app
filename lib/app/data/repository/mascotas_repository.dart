import 'package:app_crud/app/data/model/mascota_model.dart';
import 'package:app_crud/app/data/model/mascotas_response.dart';
import 'package:app_crud/app/data/provider/mascotas_api.dart';
import 'package:get/instance_manager.dart';

class MascotasRepository {
  final MascotasAPI _api = Get.find<MascotasAPI>();

  Future<MascotaResponse> getMascotas(int usuarioId, String token) =>
      _api.getMascotas(usuarioId, token);
  Future<MascotaModel> newMascotas(
          {required MascotaModel mascota, required String token}) =>
      _api.newMascota(mascota: mascota, token: token);
  Future<MascotaModel> updateMascotas(
          {required MascotaModel mascota, required String token}) =>
      _api.updateMascota(mascota: mascota, token: token);
  Future<MascotaModel> deleteMascotas(
          {required MascotaModel mascota, required String token}) =>
      _api.deleteMascota(mascota: mascota, token: token);
}

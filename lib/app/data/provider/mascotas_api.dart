import 'package:app_crud/app/data/model/mascota_model.dart';
import 'package:app_crud/app/data/model/mascotas_response.dart';
import 'package:dio/dio.dart' as diox;
import 'package:get/get.dart';

class MascotasAPI {
  final diox.Dio _dio = Get.find<diox.Dio>();

  Future<MascotaResponse> getMascotas(int usuarioId, String token) async {
    _dio.options.headers["Authorization"] = "Bearer $token";
    final diox.Response response = await _dio.get(
      '/mascotas/usuario/$usuarioId',
    );
    return MascotaResponse.fromJson(response.data);
  }

  Future<MascotaModel> newMascota(
      {required MascotaModel mascota, required String token}) async {
    _dio.options.headers["Authorization"] = "Bearer $token";
    final diox.Response response =
        await _dio.post('/mascotas', data: mascota.toJsonSend());
    return MascotaModel.fromJson(response.data);
  }

  Future<MascotaModel> updateMascota(
      {required MascotaModel mascota, required String token}) async {
    _dio.options.headers["Authorization"] = "Bearer $token";
    final diox.Response response =
        await _dio.put('/mascotas/${mascota.id}', data: mascota.toJson());
    return MascotaModel.fromJson(response.data);
  }

  Future<MascotaModel> deleteMascota(
      {required MascotaModel mascota, required String token}) async {
    _dio.options.headers["Authorization"] = "Bearer $token";
    final diox.Response response =
        await _dio.delete('/mascotas/${mascota.id}', data: mascota.toJson());
    return MascotaModel.fromJson(response.data);
  }
}

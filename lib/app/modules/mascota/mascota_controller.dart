import 'package:app_crud/app/data/model/mascota_model.dart';
import 'package:app_crud/app/data/repository/mascotas_repository.dart';
import 'package:app_crud/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class MascotaController extends GetxController {
  final _homeController = Get.find<HomeController>();
  final _mascotaRepository = Get.find<MascotasRepository>();
  String nombre = '';
  String raza = '';
  int meses = 12;
  bool nuevo = true;
  TextEditingController controlladorNombre = TextEditingController();
  TextEditingController controlladorMes = TextEditingController();
  TextEditingController controlladorRaza = TextEditingController();
  MascotaModel _mascota = MascotaModel();

  @override
  void onInit() {
    super.onInit();
    final argumentos = Get.arguments;

    if (argumentos != null) {
      final MascotaModel mascota = Get.arguments;
      _mascota = mascota;
      print(mascota);
      nuevo = false;
      nombre = _mascota.nombre!;
      raza = _mascota.raza!;
      meses = _mascota.meses!;
      controlladorNombre = TextEditingController(text: mascota.nombre!);
      controlladorRaza = TextEditingController(text: mascota.raza!);
      controlladorMes = TextEditingController(text: mascota.meses!.toString());
    }
  }

  void onChangeNombre(String valor) {
    nombre = valor;
  }

  void onChangeRaza(String valor) {
    raza = valor;
  }

  void onChangeMeses(String valor) {
    meses = int.parse(valor);
  }

  bool validar() {
    if (nombre.length > 1 && raza.length > 1 && meses >= 0) {
      return true;
    } else {
      return false;
    }
  }

  void crearMascota() async {
    try {
      if (validar()) {
        MascotaModel nuevaMascota = MascotaModel();
        nuevaMascota.meses = meses;
        nuevaMascota.nombre = nombre;
        nuevaMascota.raza = raza;
        nuevaMascota.usuarioId = _homeController.usuario.id!;

        MascotaModel mascotaIngresada = await _mascotaRepository.newMascotas(
            mascota: nuevaMascota, token: _homeController.jwt);
        _homeController.addMascota(mascotaIngresada);
        Get.back();
      } else {
        Get.showSnackbar(
          GetBar(
            title: 'Error',
            message: 'Debe llenar todos los campos',
            duration: Duration(seconds: 2),
            margin: EdgeInsets.symmetric(horizontal: 20),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  void actualizarMascota() async {
    try {
      if (validar()) {
        _mascota.meses = meses;
        _mascota.nombre = nombre;
        _mascota.raza = raza;
        _mascota.usuarioId = _homeController.usuario.id!;

        MascotaModel mascotaActualizada = await _mascotaRepository
            .updateMascotas(mascota: _mascota, token: _homeController.jwt);
        _homeController.actualizarMascota(mascotaActualizada);
        Get.back();
      } else {
        Get.showSnackbar(
          GetBar(
            title: 'Error',
            message: 'Debe llenar todos los campos',
            duration: Duration(seconds: 2),
            margin: EdgeInsets.symmetric(horizontal: 20),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  void eliminarMascota() async {
    try {
      MascotaModel mascotaActualizada = await _mascotaRepository.deleteMascotas(
          mascota: _mascota, token: _homeController.jwt);
      _homeController.eliminarMascota(mascotaActualizada);
      Get.back();
    } catch (e) {
      print(e);
    }
  }
}

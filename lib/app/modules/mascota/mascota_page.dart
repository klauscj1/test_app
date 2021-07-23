import 'package:app_crud/app/modules/mascota/mascota_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class MascotaPage extends StatelessWidget {
  const MascotaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MascotaController>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(_.nuevo ? 'Nueva mascota' : 'Modificar mascota'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 10, right: 10, bottom: 10),
              child: TextField(
                controller: _.controlladorNombre,
                onChanged: _.onChangeNombre,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Nombre de tu mascota'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: TextField(
                controller: _.controlladorRaza,
                onChanged: _.onChangeRaza,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Raza de tu mascota'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: TextField(
                controller: _.controlladorMes,
                onChanged: _.onChangeMeses,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Edad en meses de tu mascota'),
              ),
            ),
            _.nuevo
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          _.crearMascota();
                        },
                        child: Text('Guardar'),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          _.actualizarMascota();
                        },
                        child: Text('Actualizar'),
                      ),
                    ),
                  ),
            !_.nuevo
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          _.eliminarMascota();
                        },
                        child: Text('Eliminar'),
                      ),
                    ),
                  )
                : Container(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Container(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('Cancelar'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

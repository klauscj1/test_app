import 'package:app_crud/app/data/model/mascota_model.dart';
import 'package:app_crud/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class MacotaItem extends StatelessWidget {
  const MacotaItem({
    Key? key,
    required this.mascota,
  }) : super(key: key);

  final MascotaModel mascota;

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return ListTile(
      title: Text(mascota.nombre!),
      subtitle: Text('${mascota.raza} de ${mascota.meses} de edad '),
      leading: CircleAvatar(
        child: Text('${mascota.nombre!.substring(0, 2)}'),
      ),
      trailing: IconButton(
        onPressed: () {
          homeController.navegarModificarMascota(mascota);
        },
        icon: Icon(
          Icons.info_outline,
          color: Theme.of(context).primaryColor,
          size: 30,
        ),
      ),
    );
  }
}

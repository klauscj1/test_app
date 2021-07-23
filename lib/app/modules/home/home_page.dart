import 'package:app_crud/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'local_widgets/mascota_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'mascostas',
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('Mascotas'),
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app_rounded),
              onPressed: () {
                _.cerrarSesion();
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _.navegarNuevaMascota();
          },
          child: Icon(Icons.add),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Hola, ${_.usuario.username}',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              GetBuilder<HomeController>(
                id: 'mascotas',
                builder: (__) => _.mascotas.length > 0
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: _.mascotas.length,
                          itemBuilder: (context, item) {
                            final mascota = _.mascotas[item];
                            return MacotaItem(mascota: mascota);
                          },
                        ),
                      )
                    : Expanded(
                        child: Container(
                          child: Center(
                            child: Text(
                              'No tiene mascotas registradas',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:app_crud/app/modules/mascota/mascota_controller.dart';
import 'package:get/get.dart';

class MascotaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MascotaController());
  }
}

import 'package:app_crud/app/data/model/mascota_model.dart';

class MascotaResponse {
  MascotaResponse({
    this.ok,
    this.mascotas,
  });

  bool? ok;
  List<MascotaModel>? mascotas;

  factory MascotaResponse.fromJson(Map<String, dynamic> json) =>
      MascotaResponse(
        ok: json["ok"],
        mascotas: List<MascotaModel>.from(
            json["mascotas"].map((x) => MascotaModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "mascotas": List<dynamic>.from(mascotas!.map((x) => x.toJson())),
      };
}

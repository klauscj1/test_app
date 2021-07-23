class MascotaModel {
  MascotaModel({
    this.id,
    this.nombre,
    this.meses,
    this.publishedAt,
    this.createdAt,
    this.updatedAt,
    this.raza,
  });

  int? id;
  String? nombre;
  int? meses;
  DateTime? publishedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? raza;
  int? usuarioId;

  factory MascotaModel.fromJson(Map<String, dynamic> json) {
    return MascotaModel(
      id: json["id"],
      nombre: json["nombre"],
      meses: json["meses"],
      publishedAt: DateTime.parse(json["published_at"]),
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      raza: json["raza"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id != null ? id : 0,
        "nombre": nombre != null ? nombre : '',
        "meses": meses != null ? meses : 0,
        "published_at": publishedAt!.toIso8601String(),
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "raza": raza != null ? raza : '',
        "usuario": usuarioId,
      };

  Map<String, dynamic> toJsonSend() {
    return {
      "nombre": nombre != null ? nombre : '',
      "meses": meses != null ? meses : 0,
      "raza": raza != null ? raza : '',
      "usuario_id": usuarioId != null ? usuarioId : 0,
    };
  }
}

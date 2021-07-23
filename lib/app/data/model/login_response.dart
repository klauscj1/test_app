import 'package:app_crud/app/data/model/usuario_model.dart';

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.jwt,
    this.user,
  });

  String? jwt;
  UsuarioModel? user;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        jwt: json["jwt"],
        user: UsuarioModel.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "jwt": jwt,
        "user": user!.toJson(),
      };
}

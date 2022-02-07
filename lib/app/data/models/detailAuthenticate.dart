// To parse this JSON data, do
//
//     final detailAuthenticate = detailAuthenticateFromJson(jsonString);

import 'dart:convert';

DetailAuthenticate detailAuthenticateFromJson(String str) =>
    DetailAuthenticate.fromJson(json.decode(str));

String detailAuthenticateToJson(DetailAuthenticate data) =>
    json.encode(data.toJson());

class DetailAuthenticate {
  DetailAuthenticate({
    this.id,
    this.proveedorId,
    this.username,
    this.usuario,
    this.roles,
  });

  int? id;
  int? proveedorId;
  String? username;
  Usuario? usuario;
  List<Role>? roles;

  factory DetailAuthenticate.fromJson(Map<String, dynamic> json) =>
      DetailAuthenticate(
        id: json["id"],
        proveedorId: json["proveedorId"],
        username: json["username"],
        usuario: Usuario.fromJson(json["usuario"]),
        roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "proveedorId": proveedorId,
        "username": username,
        "usuario": usuario?.toJson(),
        "roles": List<dynamic>.from(roles!.map((x) => x.toJson())),
      };
}

class Role {
  Role({
    this.idRol,
    this.idAplicacion,
    this.nombre,
    this.descripcion,
    this.activo,
  });

  int? idRol;
  int? idAplicacion;
  String? nombre;
  String? descripcion;
  bool? activo;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        idRol: json["idRol"],
        idAplicacion: json["idAplicacion"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        activo: json["activo"],
      );

  Map<String, dynamic> toJson() => {
        "idRol": idRol,
        "idAplicacion": idAplicacion,
        "nombre": nombre,
        "descripcion": descripcion,
        "activo": activo,
      };
}

class Usuario {
  Usuario({
    this.correo,
    this.idMarca,
    this.idTienda,
    this.idUsuario,
    this.nombreMarca,
    this.nombreTienda,
    this.nombreUsuario,
    this.nombres,
  });

  String? correo;
  int? idMarca;
  int? idTienda;
  int? idUsuario;
  String? nombreMarca;
  String? nombreTienda;
  String? nombreUsuario;
  String? nombres;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        correo: json["correo"],
        idMarca: json["idMarca"],
        idTienda: json["idTienda"],
        idUsuario: json["idUsuario"],
        nombreMarca: json["nombreMarca"],
        nombreTienda: json["nombreTienda"],
        nombreUsuario: json["nombreUsuario"],
        nombres: json["nombres"],
      );

  Map<String, dynamic> toJson() => {
        "correo": correo,
        "idMarca": idMarca,
        "idTienda": idTienda,
        "idUsuario": idUsuario,
        "nombreMarca": nombreMarca,
        "nombreTienda": nombreTienda,
        "nombreUsuario": nombreUsuario,
        "nombres": nombres,
      };
}

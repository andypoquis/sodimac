import 'dart:convert';

Authenticate authenticateFromJson(String str) =>
    Authenticate.fromJson(json.decode(str));

String authenticateToJson(Authenticate data) => json.encode(data.toJson());

class Authenticate {
  Authenticate({
    this.token,
    this.refreshToken,
    this.message,
  });

  String? token;
  String? refreshToken;
  String? message;

  factory Authenticate.fromJson(Map<String, dynamic> json) => Authenticate(
        token: json["token"],
        refreshToken: json["refreshToken"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "refreshToken": refreshToken,
        "message": message,
      };
}

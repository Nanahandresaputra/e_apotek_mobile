import 'dart:convert';

Register registerFromMap(String str) => Register.fromMap(json.decode(str));

String registerToMap(Register data) => json.encode(data.toMap());

class Register {
  int? code;
  bool? status;
  String? data;

  Register({
    this.code,
    this.status,
    this.data,
  });

  factory Register.fromMap(Map<String, dynamic> json) => Register(
        code: json["code"],
        status: json["status"],
        data: json["data"],
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "status": status,
        "data": data,
      };
}

LoginModel loginFromMap(String str) =>
    LoginModel.fromMap(json.decode(str)['data']);

String loginToMap(LoginModel data) => json.encode(data.toMap());

class LoginModel {
  String? token;
  User? user;

  LoginModel({
    this.token,
    this.user,
  });

  factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
        token: json["token"],
        user: json["user"] == null ? null : User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "token": token,
        "user": user?.toMap(),
      };
}

class User {
  int? id;
  String? email;
  String? nama;

  User({
    this.id,
    this.email,
    this.nama,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: int.parse(json["id"]),
        email: json["email"],
        nama: json["nama"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "nama": nama,
      };
}

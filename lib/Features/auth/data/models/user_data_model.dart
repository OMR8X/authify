import 'package:auhtify/Features/auth/domain/entites/user_data.dart';

class UserDataModel extends UserData {
  UserDataModel({
    required super.name,
    required super.email,
    required super.token,
    required super.password,
  });

  factory UserDataModel.fromJson(Map json) {
    return UserDataModel(
      name: json['name'],
      email: json['emial'],
      token: json['token'],
      password: json['password'],
    );
  }
  factory UserDataModel.fromEntitie(UserData userData) {
    return UserDataModel(
      email: userData.email,
      name: userData.name,
      token: userData.token,
      password: userData.password,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "name": name,
      "token": token,
      "password": password,
    };
  }
}

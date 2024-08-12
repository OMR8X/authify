import 'package:auhtify/Features/auth/domain/entites/user_data.dart';

class UserDataModel extends UserData {
  const UserDataModel();

  factory UserDataModel.fromJson(Map json) {
    return const UserDataModel();
  }
  factory UserDataModel.fromEntitie(UserData userData) {
    return const UserDataModel();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

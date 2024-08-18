import 'package:auhtify/Features/auth/data/models/user_data_model.dart';
import 'package:auhtify/Features/auth/domain/entites/user_data.dart';
import 'package:auhtify/Features/auth/domain/requests/sign_up_request.dart';
import 'package:auhtify/core/services/api/api_response.dart';

class SignUpResponse {
  final String token;
  final UserData user;

  SignUpResponse({
    required this.token,
    required this.user,
  });

  factory SignUpResponse.fromResponse(ApiResponse response) {
    return SignUpResponse(
      token: response.getData(key: "token"),
      user: UserDataModel.fromJson(response.getData(key: "user")),
    );
  }
}

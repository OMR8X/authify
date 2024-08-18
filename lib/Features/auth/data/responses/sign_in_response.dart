import '../../../../core/services/api/api_response.dart';
import '../../domain/entites/user_data.dart';
import '../models/user_data_model.dart';

class SignInResponse {
  final String token;
  final UserData user;

  SignInResponse({
    required this.token,
    required this.user,
  });

  factory SignInResponse.fromResponse(ApiResponse response) {
    return SignInResponse(
      token: response.getData(key: "token"),
      user: UserDataModel.fromJson(response.getData(key: "user")),
    );
  }
}

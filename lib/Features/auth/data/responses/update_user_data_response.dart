import '../../../../core/services/api/api_response.dart';
import '../../domain/entites/user_data.dart';
import '../models/user_data_model.dart';

class UpdateUserDataResponse {
  final String token;
  final UserData user;

  UpdateUserDataResponse({
    required this.token,
    required this.user,
  });

  factory UpdateUserDataResponse.fromResponse(ApiResponse response) {
    return UpdateUserDataResponse(
      token: response.getData(key: "token"),
      user: UserDataModel.fromJson(response.getData(key: "user")),
    );
  }
}

import '../../../../core/services/api/api_response.dart';
import '../../domain/entites/user_data.dart';
import '../models/user_data_model.dart';

class GetUserDataResponse {
  final String token;
  final UserData user;

  GetUserDataResponse({
    required this.token,
    required this.user,
  });

  factory GetUserDataResponse.fromResponse(ApiResponse response) {
    return GetUserDataResponse(
      token: response.getData(key: "token"),
      user: UserDataModel.fromJson(response.getData(key: "user")),
    );
  }
}

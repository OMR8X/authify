import 'package:auhtify/Features/auth/data/models/user_data_model.dart';
import 'package:auhtify/Features/auth/data/responses/auth_response.dart';
import 'package:auhtify/Features/auth/domain/entites/user_data.dart';
import 'package:auhtify/Features/auth/domain/requests/change_password_request.dart';
import 'package:auhtify/Features/auth/domain/requests/forget_password_request.dart';
import 'package:auhtify/Features/auth/domain/requests/sign_in_request.dart';
import 'package:auhtify/Features/auth/domain/requests/sign_up_request.dart';
import 'package:auhtify/Features/auth/domain/requests/update_user_data_request.dart';
import 'package:auhtify/core/services/api/api_client.dart';
import 'package:auhtify/core/services/api/api_constants.dart';
import 'package:auhtify/core/resources/errors/exceptions.dart';

import 'package:dartz/dartz.dart';
import 'auth_data_source.dart';

class AuthRemoteDataSourceImplements implements AuthDataSource {
  final DioClient client;

  AuthRemoteDataSourceImplements({required this.client});

  @override
  Future<UserData> changePassword({
    required ChangePasswordRequest request,
  }) async {
    //
    final dioResponse = await client.post(
      ApiUris.changePassword,
      request.toJson(),
    );
    //
    AuthResponse response = AuthResponse.fromDioResponse(dioResponse);
    //
    if (response.hasError) {
      throw AuthException(message: response.message);
    }
    //
    if (dioResponse.statusCode == 200) {
      //
      final user = UserDataModel.fromJson(response.data!["user"]);
      //
      return user;
    }
    //
    throw const ServerException();
  }

  @override
  Future<Unit> forgetPassword({
    required ForgetPasswordRequest request,
  }) async {
    //
    final dioResponse = await client.post(
      ApiUris.forgetPassword,
      request.toJson(),
    );
    //
    AuthResponse response = AuthResponse.fromDioResponse(dioResponse);
    //
    if (response.hasError) {
      throw AuthException(message: response.message);
    }
    //
    if (dioResponse.statusCode == 200) {
      return unit;
    }
    //
    throw const ServerException();
  }

  @override
  Future<UserData> signIn({
    required SignInRequest request,
  }) async {
    //
    final dioResponse = await client.post(
      ApiUris.signIn,
      request.toJson(),
    );
    //
    AuthResponse response = AuthResponse.fromDioResponse(dioResponse);
    //
    if (response.hasError) {
      throw AuthException(message: response.message);
    }
    //
    if (dioResponse.statusCode == 200) {
      //
      final user = UserDataModel.fromJson(response.data!["user"]);
      //
      return user;
    }
    //
    throw const ServerException();
  }

  @override
  Future<UserData> signUp({
    required SignUpRequest request,
  }) async {
    //
    final dioResponse = await client.post(
      ApiUris.signUp,
      request.toJson(),
    );
    //
    AuthResponse response = AuthResponse.fromDioResponse(dioResponse);
    //
    if (response.hasError) {
      throw AuthException(message: response.message);
    }
    //
    if (dioResponse.statusCode == 200) {
      //
      final user = UserDataModel.fromJson(response.data!["user"]);
      //
      return user;
    }
    //
    throw const ServerException();
  }

  @override
  Future<UserData> updateUserData({
    required UpdateUserDataRequest request,
  }) async {
    //
    final dioResponse = await client.post(ApiUris.signIn, request.toJson());
    //
    AuthResponse response = AuthResponse.fromDioResponse(dioResponse);
    //
    if (response.hasError) {
      throw AuthException(message: response.message);
    }
    //
    if (dioResponse.statusCode == 200) {
      //
      final user = UserDataModel.fromJson(response.data!["user"]);
      //
      return user;
    }
    //
    throw const ServerException();
  }
}

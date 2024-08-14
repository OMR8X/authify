import 'package:auhtify/Features/auth/data/models/user_data_model.dart';
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
    final response =
        await client.post(ApiUris.changePassword, request.toJson());
    //
    if (response.statusCode == 200) {
      //
      final json = response.data;
      if (json["error"] != null) {
        throw AuthException(message: json["error"]);
      }
      //
      final user = UserDataModel.fromJson(json["data"]);
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
    final response =
        await client.post(ApiUris.forgetPassword, request.toJson());
    //
    if (response.statusCode == 200) {
      //
      final json = response.data;
      //
      if (json["error"] != null) {
        throw AuthException(message: json["error"]);
      }
      return unit;
    }
    //
    //
    throw const ServerException();
  }

  @override
  Future<UserData> signIn({
    required SignInRequest request,
  }) async {
    //
    final response = await client.post(ApiUris.signIn, request.toJson());
    //
    if (response.statusCode == 200) {
      //
      final json = response.data;
      //
      if (json["error"] != null) {
        throw AuthException(message: json["error"]);
      }
      //
      final user = UserDataModel.fromJson(json["data"]);
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
    final response = await client.post(ApiUris.signUp, request.toJson());
    //
    if (response.statusCode == 200) {
      //
      final json = response.data;
      //
      if (json["error"] != null) {
        throw AuthException(message: json["error"]);
      }
      //
      final user = UserDataModel.fromJson(json["data"]);
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
    final response = await client.post(ApiUris.signIn, request.toJson());
    //
    if (response.statusCode == 200) {
      //
      final json = response.data;
      //
      if (json["error"] != null) {
        throw AuthException(message: json["error"]);
      }
      //
      final user = UserDataModel.fromJson(json["data"]);
      //
      return user;
    }
    //
    throw const ServerException();
  }
}

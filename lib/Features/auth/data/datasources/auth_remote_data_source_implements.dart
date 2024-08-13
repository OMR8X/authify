import 'package:auhtify/Features/auth/data/models/user_data_model.dart';
import 'package:auhtify/Features/auth/domain/entites/user_data.dart';
import 'package:auhtify/Features/auth/domain/requests/change_password_request.dart';
import 'package:auhtify/Features/auth/domain/requests/forget_password_request.dart';
import 'package:auhtify/Features/auth/domain/requests/sign_in_request.dart';
import 'package:auhtify/Features/auth/domain/requests/sign_up_request.dart';
import 'package:auhtify/Features/auth/domain/requests/update_user_data_request.dart';
import 'package:auhtify/core/services/api/api_client.dart';
import 'package:auhtify/core/services/api/api_constants.dart';
import 'package:auhtify/core/services/errors/exceptions.dart';

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
    final response = await client.post(ApiUris.signIn, request.toJson());
    //
    if (response.statusCode == 200) {
      final data = response.data;
      final user = UserDataModel.fromJson(data);
      return user;
    }
    //
    // TODO: handle different type of exceptions
    throw const ServerException();
  }

  @override
  Future<Unit> forgetPassword({
    required ForgetPasswordRequest request,
  }) async {
    //
    final response = await client.post(ApiUris.signIn, request.toJson());
    //
    if (response.statusCode == 200) {
      return unit;
    }
    //
    // TODO: handle different type of exceptions
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
      final data = response.data;
      final user = UserDataModel.fromJson(data);
      return user;
    }
    //
    // TODO: handle different type of exceptions
    throw const ServerException();
  }

  @override
  Future<UserData> signUp({
    required SignUpRequest request,
  }) async {
    //
    final response = await client.post(ApiUris.signIn, request.toJson());
    //
    if (response.statusCode == 200) {
      final data = response.data;
      final user = UserDataModel.fromJson(data);
      return user;
    }
    //
    // TODO: handle different type of exceptions
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
      final data = response.data;
      final user = UserDataModel.fromJson(data);
      return user;
    }
    //
    // TODO: handle different type of exceptions
    throw const ServerException();
  }
}

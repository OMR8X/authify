import 'package:auhtify/Features/auth/data/models/user_data_model.dart';
import 'package:auhtify/Features/auth/data/responses/change_password_response.dart';
import 'package:auhtify/Features/auth/data/responses/forget_password_response.dart';
import 'package:auhtify/Features/auth/data/responses/get_user_data_response.dart';
import 'package:auhtify/Features/auth/data/responses/sign_in_response.dart';
import 'package:auhtify/Features/auth/data/responses/sign_out_response.dart';
import 'package:auhtify/Features/auth/data/responses/sign_up_response.dart';
import 'package:auhtify/Features/auth/data/responses/update_user_data_response.dart';
import 'package:auhtify/Features/auth/domain/entites/user_data.dart';
import 'package:auhtify/Features/auth/domain/requests/change_password_request.dart';
import 'package:auhtify/Features/auth/domain/requests/forget_password_request.dart';
import 'package:auhtify/Features/auth/domain/requests/get_user_data_request.dart';
import 'package:auhtify/Features/auth/domain/requests/sign_in_request.dart';
import 'package:auhtify/Features/auth/domain/requests/sign_out_request.dart';
import 'package:auhtify/Features/auth/domain/requests/sign_up_request.dart';
import 'package:auhtify/Features/auth/domain/requests/update_user_data_request.dart';
import 'package:auhtify/core/services/api/api_constants.dart';
import 'package:auhtify/core/resources/errors/exceptions.dart';
import 'package:auhtify/core/services/api/responses/api_response.dart';
import 'package:auhtify/core/services/tokens/tokens_manager.dart';

import 'package:dartz/dartz.dart';
import '../../../../core/services/api/api_manager.dart';
import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImplements implements AuthRemoteDataSource {
  final ApiManager apiManager;

  AuthRemoteDataSourceImplements({required this.apiManager});

  @override
  Future<ChangePasswordResponse> changePassword({
    required ChangePasswordRequest request,
  }) async {
    //
    final dioResponse = await apiManager().post(
      ApiUris.changePassword,
      body: request.toBody(),
    );
    //
    ApiResponse apiResponse = ApiResponse.fromDioResponse(dioResponse);
    //
    if (apiResponse.hasError) {
      throw AuthException(message: apiResponse.getMessage());
    }
    //
    if (dioResponse.statusCode == 200) {
      //
      return ChangePasswordResponse.fromResponse(apiResponse);
    }
    //
    throw const ServerException();
  }

  @override
  Future<ForgetPasswordResponse> forgetPassword({
    required ForgetPasswordRequest request,
  }) async {
    //
    final dioResponse = await apiManager().post(
      ApiUris.forgetPassword,
      body: request.toBody(),
    );
    //
    ApiResponse apiResponse = ApiResponse.fromDioResponse(dioResponse);
    //
    if (apiResponse.hasError) {
      throw AuthException(message: apiResponse.getMessage());
    }
    //
    if (dioResponse.statusCode == 200) {
      return ForgetPasswordResponse.fromResponse(apiResponse);
    }
    //
    throw const ServerException();
  }

  @override
  Future<SignInResponse> signIn({
    required SignInRequest request,
  }) async {
    //
    final dioResponse = await apiManager().post(
      ApiUris.signIn,
      body: request.toBody(),
    );
    //
    ApiResponse apiResponse = ApiResponse.fromDioResponse(dioResponse);
    //
    if (apiResponse.hasError) {
      throw AuthException(message: apiResponse.getMessage());
    }
    //
    if (dioResponse.statusCode == 200) {
      //
      final response = SignInResponse.fromResponse(apiResponse);
      //
      return response;
    }
    //
    throw const ServerException();
  }

  @override
  Future<SignUpResponse> signUp({
    required SignUpRequest request,
  }) async {
    //
    final dioResponse = await apiManager().post(
      ApiUris.signUp,
      body: request.toBody(),
    );
    //
    ApiResponse apiResponse = ApiResponse.fromDioResponse(dioResponse);
    //
    if (apiResponse.hasError) {
      throw AuthException(message: apiResponse.getMessage());
    }
    //
    if (dioResponse.statusCode == 200) {
      //
      final response = SignUpResponse.fromResponse(apiResponse);
      //
      return response;
    }
    //
    throw const ServerException();
  }

  @override
  Future<GetUserDataResponse> getUserData({
    required GetUserDataRequest request,
  }) async {
    //
    final dioResponse = await apiManager().post(
      ApiUris.getUserData,
      requireAuth: true,
    );
    //
    ApiResponse apiResponse = ApiResponse.fromDioResponse(dioResponse);
    //
    if (apiResponse.hasError) {
      throw AuthException(message: apiResponse.getMessage());
    }
    //
    if (dioResponse.statusCode == 200) {
      //
      return GetUserDataResponse.fromResponse(apiResponse);
    }
    //
    throw const ServerException();
  }

  @override
  Future<SignOutResponse> signOut({required SignOutRequest request}) async {
    //
    final dioResponse = await apiManager().post(
      ApiUris.signOut,
      requireAuth: true,
    );
    //
    ApiResponse apiResponse = ApiResponse.fromDioResponse(dioResponse);
    //
    if (apiResponse.hasError) {
      throw AuthException(message: apiResponse.getMessage());
    }
    //
    if (dioResponse.statusCode == 200) {
      //
      // delete token
      await TokenManager.instance.deleteToken();
      //
      return SignOutResponse.fromResponse(apiResponse);
    }
    //
    throw const ServerException();
  }

  @override
  Future<UpdateUserDataResponse> updateUserData({
    required UpdateUserDataRequest request,
  }) async {
    //
    final dioResponse = await apiManager().post(
      ApiUris.updateUserData,
      body: request.toBody(),
      requireAuth: true,
    );
    //
    ApiResponse apiResponse = ApiResponse.fromDioResponse(dioResponse);
    //
    if (apiResponse.hasError) {
      throw AuthException(message: apiResponse.getMessage());
    }
    //
    if (dioResponse.statusCode == 200) {
      //
      return UpdateUserDataResponse.fromResponse(apiResponse);
    }
    //
    throw const ServerException();
  }
}

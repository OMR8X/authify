import 'package:auhtify/Features/auth/domain/entites/user_data.dart';

import 'package:auhtify/Features/auth/domain/requests/change_password_request.dart';

import 'package:auhtify/Features/auth/domain/requests/forget_password_request.dart';

import 'package:auhtify/Features/auth/domain/requests/sign_in_request.dart';

import 'package:auhtify/Features/auth/domain/requests/sign_up_request.dart';

import 'package:auhtify/Features/auth/domain/requests/update_user_data_request.dart';

import 'package:dartz/dartz.dart';

import 'auth_data_source.dart';

class AuthRemoteDataSourceImplements implements AuthDataSource {
  @override
  Future<UserData> changePassword({required ChangePasswordRequest request}) {
    throw UnimplementedError();
  }

  @override
  Future<Unit> forgetPassword({required ForgetPasswordRequest request}) {
    throw UnimplementedError();
  }

  @override
  Future<UserData> signIn({required SignInRequest request}) {
    throw UnimplementedError();
  }

  @override
  Future<UserData> signUp({required SignUpRequest request}) {
    throw UnimplementedError();
  }

  @override
  Future<UserData> updateUserData({required UpdateUserDataRequest request}) {
    throw UnimplementedError();
  }
}

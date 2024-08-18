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
import 'package:auhtify/core/resources/errors/failures.dart';

import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  // change user password
  Future<Either<Failure, ChangePasswordResponse>> changePassword({
    required ChangePasswordRequest request,
  });
  // send code to user via email to reset password.
  Future<Either<Failure, ForgetPasswordResponse>> forgetPassword({
    required ForgetPasswordRequest request,
  });
  // signing in
  Future<Either<Failure, SignInResponse>> signIn({
    required SignInRequest request,
  });
  // signing up
  Future<Either<Failure, SignUpResponse>> signUp({
    required SignUpRequest request,
  });
  // signing out
  Future<Either<Failure, SignOutResponse>> signOut({
    required SignOutRequest request,
  });
  // update user data
  Future<Either<Failure, UpdateUserDataResponse>> updateUserData({
    required UpdateUserDataRequest request,
  });
  //
  Future<Either<Failure, GetUserDataResponse>> getUserData({
    required GetUserDataRequest request,
  });
}

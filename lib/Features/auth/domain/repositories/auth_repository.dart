import 'package:auhtify/Features/auth/domain/entites/user_data.dart';
import 'package:auhtify/Features/auth/domain/requests/change_password_request.dart';
import 'package:auhtify/Features/auth/domain/requests/forget_password_request.dart';
import 'package:auhtify/Features/auth/domain/requests/sign_in_request.dart';
import 'package:auhtify/Features/auth/domain/requests/sign_up_request.dart';
import 'package:auhtify/Features/auth/domain/requests/update_user_data_request.dart';
import 'package:auhtify/core/services/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  // change user password
  Future<Either<AppFailure, UserData>> changePassword({
    required ChangePasswordRequest request,
  });
  // send code to user via email to reset password.
  Future<Either<AppFailure, Unit>> forgetPassword({
    required ForgetPasswordRequest request,
  });
  // signing in
  Future<Either<AppFailure, UserData>> signIn({
    required SignInRequest request,
  });
  // signing up
  Future<Either<AppFailure, UserData>> signUp({
    required SignUpRequest request,
  });
  // update user data
  Future<Either<AppFailure, UserData>> updateUserData({
    required UpdateUserDataRequest request,
  });
}

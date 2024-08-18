import 'package:auhtify/Features/auth/data/responses/sign_in_response.dart';
import 'package:auhtify/Features/auth/data/responses/sign_up_response.dart';
import 'package:auhtify/Features/auth/domain/requests/get_user_data_request.dart';
import 'package:auhtify/Features/auth/domain/requests/sign_out_request.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entites/user_data.dart';
import '../../domain/requests/change_password_request.dart';
import '../../domain/requests/forget_password_request.dart';
import '../../domain/requests/sign_in_request.dart';
import '../../domain/requests/sign_up_request.dart';
import '../../domain/requests/update_user_data_request.dart';

abstract class AuthRemoteDataSource {
  // change user password
  Future<Unit> changePassword({
    required ChangePasswordRequest request,
  });
  // send code to user via email to reset password.
  Future<Unit> forgetPassword({
    required ForgetPasswordRequest request,
  });
  // signing in
  Future<SignInResponse> signIn({
    required SignInRequest request,
  });
  // signing up
  Future<SignUpResponse> signUp({
    required SignUpRequest request,
  });
  // update user data
  Future<UserData> updateUserData({
    required UpdateUserDataRequest request,
  });
  // update user data
  Future<Unit> signOut({
    required SignOutRequest request,
  });
  //
  // update user data
  Future<UserData> getUserData({
    required GetUserDataRequest request,
  });
}

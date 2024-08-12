import 'package:dartz/dartz.dart';

import '../../domain/entites/user_data.dart';
import '../../domain/requests/change_password_request.dart';
import '../../domain/requests/forget_password_request.dart';
import '../../domain/requests/sign_in_request.dart';
import '../../domain/requests/sign_up_request.dart';
import '../../domain/requests/update_user_data_request.dart';

abstract class AuthDataSource {
  
  // change user password
  Future<UserData> changePassword({
    required ChangePasswordRequest request,
  });
  // send code to user via email to reset password.
  Future<Unit> forgetPassword({
    required ForgetPasswordRequest request,
  });
  // signing in
  Future<UserData> signIn({
    required SignInRequest request,
  });
  // signing up
  Future<UserData> signUp({
    required SignUpRequest request,
  });
  // update user data
  Future<UserData> updateUserData({
    required UpdateUserDataRequest request,
  });
}

import 'package:dartz/dartz.dart';

import '../../../../core/services/errors/failures.dart';
import '../../domain/entites/user_data.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/requests/change_password_request.dart';
import '../../domain/requests/forget_password_request.dart';
import '../../domain/requests/sign_in_request.dart';
import '../../domain/requests/sign_up_request.dart';
import '../../domain/requests/update_user_data_request.dart';
import '../datasources/auth_remote_data_source_implements.dart';

class AuthRepositoryImplement implements AuthRepository {
  final AuthRemoteDataSourceImplements remoteDataSource;

  AuthRepositoryImplement({
    required this.remoteDataSource,
  });

  @override
  Future<Either<AppFailure, UserData>> changePassword({
    required ChangePasswordRequest request,
  }) async {
    //
    // here we check the internet connection
    // if there is no internet then we should immeidetly return no network fialure.
    //
    try {
      final response = await remoteDataSource.changePassword(request: request);
      return right(response);
    } on Exception {
      return left(const AnonFailure());
    }
  }

  @override
  Future<Either<AppFailure, Unit>> forgetPassword({
    required ForgetPasswordRequest request,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<AppFailure, UserData>> signIn({
    required SignInRequest request,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<AppFailure, UserData>> signUp({
    required SignUpRequest request,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<AppFailure, UserData>> updateUserData({
    required UpdateUserDataRequest request,
  }) async {
    throw UnimplementedError();
  }
}

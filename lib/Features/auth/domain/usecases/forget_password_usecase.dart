import 'package:auhtify/Features/auth/domain/entites/user_data.dart';
import 'package:auhtify/Features/auth/domain/requests/change_password_request.dart';

import '../../../../core/resources/errors/failures.dart';
import '../repositories/auth_repository.dart';
import '../requests/forget_password_request.dart';
import '../requests/sign_in_request.dart';

import 'package:dartz/dartz.dart';

class ForgetPasswordUseCase {
  final AuthRepository repository;

  ForgetPasswordUseCase({required this.repository});

  Future<Either<Failure, Unit>> call({
    required ForgetPasswordRequest request,
  }) async {
    return await repository.forgetPassword(request: request);
  }
}

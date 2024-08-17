import '../../../../core/resources/errors/failures.dart';
import '../repositories/auth_repository.dart';
import '../requests/forget_password_request.dart';

import 'package:dartz/dartz.dart';

class ChangePasswordUseCase {
  final AuthRepository repository;

  ChangePasswordUseCase({required this.repository});

  Future<Either<Failure, Unit>> call({
    required ForgetPasswordRequest request,
  }) async {
    return await repository.forgetPassword(request: request);
  }
}

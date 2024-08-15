import 'package:auhtify/Features/auth/domain/entites/user_data.dart';
import 'package:auhtify/Features/auth/domain/requests/change_password_request.dart';
import 'package:auhtify/core/usecases/use_case.dart';

import '../../../../core/resources/errors/failures.dart';
import '../repositories/auth_repository.dart';

import 'package:dartz/dartz.dart';

class ChangePasswordUsecase extends UseCase<UserData, ChangePasswordRequest> {
  final AuthRepository authRepository;

  ChangePasswordUsecase({required this.authRepository});

  @override
  Future<Either<Failure, UserData>> call(
      [ChangePasswordRequest? parameter]) async {
    return await authRepository.changePassword(request: parameter!);
  }
}

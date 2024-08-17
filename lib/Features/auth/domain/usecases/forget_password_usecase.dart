import 'package:auhtify/Features/auth/domain/entites/user_data.dart';
import 'package:auhtify/Features/auth/domain/requests/change_password_request.dart';

import '../../../../core/resources/errors/failures.dart';
import '../repositories/auth_repository.dart';
import '../requests/sign_in_request.dart';

import 'package:dartz/dartz.dart';

class ChangePasswordUseCase {
  final AuthRepository repository;

  ChangePasswordUseCase({required this.repository});

  Future<Either<Failure, UserData>> call({
    required ChangePasswordRequest request,
  }) async {
    return await repository.changePassword(request: request);
  }
}

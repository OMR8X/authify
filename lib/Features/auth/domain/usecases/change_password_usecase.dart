import 'package:auhtify/Features/auth/data/responses/change_password_response.dart';
import 'package:auhtify/Features/auth/domain/requests/change_password_request.dart';

import '../../../../core/resources/errors/failures.dart';
import '../repositories/auth_repository.dart';
import '../requests/forget_password_request.dart';

import 'package:dartz/dartz.dart';

class ChangePasswordUseCase {
  final AuthRepository repository;

  ChangePasswordUseCase({required this.repository});

  Future<Either<Failure, ChangePasswordResponse>> call({
    required ChangePasswordRequest request,
  }) async {
    return await repository.changePassword(request: request);
  }
}

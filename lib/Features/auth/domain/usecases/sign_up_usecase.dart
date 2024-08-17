import 'package:auhtify/Features/auth/domain/entites/user_data.dart';
import 'package:auhtify/Features/auth/domain/requests/sign_up_request.dart';
import '../../../../core/resources/errors/failures.dart';
import '../repositories/auth_repository.dart';

import 'package:dartz/dartz.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase({required this.repository});

  Future<Either<Failure, UserData>> call({
    required SignUpRequest request,
  }) async {
    return await repository.signUp(request: request);
  }
}

import 'package:auhtify/Features/auth/domain/entites/user_data.dart';

import '../../../../core/resources/errors/failures.dart';
import '../repositories/auth_repository.dart';
import '../requests/sign_in_request.dart';

import 'package:dartz/dartz.dart';

class SignInUseCase {
  final AuthRepository repository;

  SignInUseCase({required this.repository});

  Future<Either<Failure, UserData>> call({
    required SignInRequest request,
  }) async {
    return await repository.signIn(request: request);
  }
}

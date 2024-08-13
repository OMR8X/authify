import 'package:auhtify/Features/auth/domain/entites/user_data.dart';

import '../../../../core/services/errors/failures.dart';
import '../repositories/auth_repository.dart';
import '../requests/sign_in_request.dart';

import 'package:dartz/dartz.dart';

class SignInUsecase {
  final AuthRepository repository;

  SignInUsecase({required this.repository});

  Future<Either<Failure, UserData>> call({required SignInRequest request}) {
    return repository.signIn(request: request);
  }
}

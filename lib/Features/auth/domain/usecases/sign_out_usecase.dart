import 'package:auhtify/Features/auth/data/responses/sign_out_response.dart';
import 'package:auhtify/Features/auth/domain/requests/change_password_request.dart';
import 'package:auhtify/Features/auth/domain/requests/sign_out_request.dart';

import '../../../../core/resources/errors/failures.dart';
import '../repositories/auth_repository.dart';
import '../requests/forget_password_request.dart';

import 'package:dartz/dartz.dart';

class SignOutUseCase {
  final AuthRepository repository;

  SignOutUseCase({required this.repository});

  Future<Either<Failure, SignOutResponse>> call({required SignOutRequest request}) async {
    return await repository.signOut(request: request);
  }
}

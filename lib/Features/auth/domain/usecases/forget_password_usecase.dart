import 'package:auhtify/Features/auth/domain/repositories/auth_repository.dart';
import 'package:auhtify/Features/auth/domain/requests/forget_password_request.dart';
import 'package:auhtify/core/resources/errors/failures.dart';
import 'package:auhtify/core/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class ForgetPasswordUsecase extends UseCase<Unit, ForgetPasswordRequest> {
  final AuthRepository authRepository;

  ForgetPasswordUsecase(this.authRepository);

  @override
  Future<Either<Failure, Unit>> call([ForgetPasswordRequest? parameter]) async {
    return await authRepository.forgetPassword(request: parameter!);
  }
}

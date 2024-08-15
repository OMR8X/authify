import 'package:auhtify/Features/auth/domain/entites/user_data.dart';
import 'package:auhtify/Features/auth/domain/repositories/auth_repository.dart';
import 'package:auhtify/Features/auth/domain/requests/sign_up_request.dart';
import 'package:auhtify/core/resources/errors/failures.dart';
import 'package:auhtify/core/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class SignUpUsecase extends UseCase<UserData, SignUpRequest> {
  final AuthRepository authRepository;

  SignUpUsecase({required this.authRepository});

  @override
  Future<Either<Failure, UserData>> call([SignUpRequest? parameter]) async {
    return await authRepository.signUp(request: parameter!);
  }
}

import 'package:auhtify/Features/auth/domain/entites/user_data.dart';
import 'package:auhtify/core/usecases/use_case.dart';
import '../../../../core/resources/errors/failures.dart';
import '../repositories/auth_repository.dart';
import '../requests/sign_in_request.dart';
import 'package:dartz/dartz.dart';

class SignInUsecase extends UseCase<UserData, SignInRequest> {
  final AuthRepository authRepository;

  SignInUsecase({required this.authRepository});

  @override
  Future<Either<Failure, UserData>> call([SignInRequest? parameter]) async {
    return await authRepository.signIn(request: parameter!);
  }
}

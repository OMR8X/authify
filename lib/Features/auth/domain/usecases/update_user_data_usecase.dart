import 'package:auhtify/Features/auth/domain/entites/user_data.dart';
import 'package:auhtify/Features/auth/domain/repositories/auth_repository.dart';
import 'package:auhtify/Features/auth/domain/requests/update_user_data_request.dart';
import 'package:auhtify/core/resources/errors/failures.dart';
import 'package:auhtify/core/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class UpdateUserDataUsecase extends UseCase<UserData, UpdateUserDataRequest> {
  final AuthRepository authRepository;

  UpdateUserDataUsecase(this.authRepository);

  @override
  Future<Either<Failure, UserData>> call(
      [UpdateUserDataRequest? parameter]) async {
    return await authRepository.updateUserData(request: parameter!);
  }
}

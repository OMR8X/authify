import 'package:auhtify/Features/auth/data/responses/update_user_data_response.dart';
import 'package:auhtify/Features/auth/domain/entites/user_data.dart';
import 'package:auhtify/core/usecases/use_case.dart';

import '../../../../core/resources/errors/failures.dart';
import '../repositories/auth_repository.dart';
import '../requests/sign_in_request.dart';

import 'package:dartz/dartz.dart';

import '../requests/update_user_data_request.dart';

class UpdateUserDataUseCase {
  final AuthRepository repository;

  UpdateUserDataUseCase({required this.repository});

  Future<Either<Failure, UpdateUserDataResponse>> call({
    required UpdateUserDataRequest request,
  }) async {
    return await repository.updateUserData(request: request);
  }
}

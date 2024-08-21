import 'package:auhtify/Features/files/domain/repository/files_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/resources/errors/failures.dart';
import '../../data/responses/get_all_files_response.dart';
import '../requests/get_all_files_request.dart';

class GetAllFilesUseCase {
  final FilesRepository repository;

  GetAllFilesUseCase({
    required this.repository,
  });
  Future<Either<Failure, GetAllFilesResponse>> call({
    required GetAllFilesRequest request,
  }) {
    return repository.getAllFiles(request: request);
  }
}

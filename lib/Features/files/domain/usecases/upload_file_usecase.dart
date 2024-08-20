import 'package:auhtify/Features/files/data/responses/upload_file_response.dart';
import 'package:auhtify/Features/files/domain/repository/files_repository.dart';
import 'package:auhtify/Features/files/domain/requests/upload_file_request.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/resources/errors/failures.dart';

class UploadFileUseCase {
  final FilesRepository repository;

  UploadFileUseCase({
    required this.repository,
  });
  Future<Either<Failure, UploadFileResponse>> call({
    required UploadFileRequest request,
  }) {
    return repository.uploadFile(request: request);
  }
}

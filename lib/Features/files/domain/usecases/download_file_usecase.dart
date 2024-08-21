import 'package:auhtify/Features/files/data/responses/download_file_response.dart';
import 'package:auhtify/Features/files/domain/repository/files_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/resources/errors/failures.dart';
import '../requests/download_file_request.dart';

class DownloadFileUseCase {
  final FilesRepository repository;

  DownloadFileUseCase({
    required this.repository,
  });
    Future<Either<Failure, Unit>> call({
    required DownloadFileRequest request,
  }) {
    return repository.downloadFile(request: request);
  }
}

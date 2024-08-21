// ignore: unused_import
import 'package:auhtify/Features/files/data/responses/download_file_response.dart';
import 'package:auhtify/Features/files/data/responses/upload_file_response.dart';
import 'package:auhtify/Features/files/domain/requests/download_file_request.dart';
import 'package:auhtify/Features/files/domain/requests/upload_file_request.dart';
import 'package:auhtify/core/resources/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class FilesRepository {
  ///
  Future<Either<Failure, Unit>> uploadFile({
    required UploadFileRequest request,
  });

  ///
  Future<Either<Failure, Unit>> downloadFile({
    required DownloadFileRequest request,
  });
}

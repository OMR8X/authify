import 'package:auhtify/Features/files/data/datasources/files_remote_datasource.dart';
import 'package:auhtify/Features/files/data/responses/download_file_response.dart';
import 'package:auhtify/Features/files/data/responses/upload_file_response.dart';
import 'package:auhtify/Features/files/domain/repository/files_repository.dart';
import 'package:auhtify/Features/files/domain/requests/download_file_request.dart';
import 'package:auhtify/Features/files/domain/requests/upload_file_request.dart';
import 'package:auhtify/core/resources/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FilesRepositoryImplement implements FilesRepository {
  final FilesRemoteDataSource remoteDataSource;

  FilesRepositoryImplement({
    required this.remoteDataSource,
  });
  @override
  Future<Unit> downloadFile({
    required DownloadFileRequest request,
  }) async {
    return await remoteDataSource.downloadFile(
      request: request,
    );
  }

  @override
  Future<Either<Failure, UploadFileResponse>> uploadFile({
    required UploadFileRequest request,
  }) {
    // TODO: implement uploadFile
    throw UnimplementedError();
  }
}

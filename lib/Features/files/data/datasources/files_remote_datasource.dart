import 'package:auhtify/Features/files/domain/requests/download_file_request.dart';
import 'package:dartz/dartz.dart';

import '../../domain/requests/upload_file_request.dart';

abstract class FilesRemoteDataSource {
  ///
  Future<Unit> downloadFile({
    required DownloadFileRequest request,
  });

  ///
  Future<Unit> uploadFile({
    required UploadFileRequest request,
  });
}

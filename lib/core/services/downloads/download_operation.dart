import 'dart:async';
import 'dart:io' as io;
import 'package:auhtify/Features/files/domain/usecases/download_file_usecase.dart';
import 'package:auhtify/core/injection/app_injection.dart';
import 'package:dio/dio.dart';

import '../../../Features/files/data/responses/download_file_response.dart';
import '../../../Features/files/domain/requests/download_file_request.dart';

class DownloadOperation {
  ///
  final int id;

  ///
  final String path;

  ///
  final String fileId;

  ///
  late DownloadFileRequest request;

  DownloadOperation({
    required this.id,
    required this.path,
    required this.fileId,
  });

  ///
  Future<void> forward({
    required StreamController<DownloadFileResponse> controller,
  }) async {
    ///
    request = DownloadFileRequest(
      fileId: fileId,
      controller: controller,
      filePath: path,
      cancelToken: CancelToken(),
    );

    ///
    await sl<DownloadFileUseCase>().call(request: request);

    return;
  }

  ///
  Future<void> pause() async {
    /// stop operation without deleting the file
    request.subscription.cancel();
  }

  ///
  Future<void> cancel() async {
    /// cancel operation
    request.subscription.cancel();

    /// delete file
    await io.File(path).delete();
  }
}

enum OperationState {
  initial,
  downloading,
  completed,
  failed,
}

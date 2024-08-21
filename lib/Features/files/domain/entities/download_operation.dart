import 'dart:async';
import 'dart:io' as io;
import 'package:auhtify/Features/files/domain/usecases/download_file_usecase.dart';
import 'package:auhtify/core/injection/app_injection.dart';
import 'package:dio/dio.dart';

import '../../data/responses/download_file_response.dart';
import '../requests/download_file_request.dart';

class DownloadOperation {
  ///
  final String name;

  ///
  final String path;

  ///
  final String fileId;

  ///
  late DownloadFileRequest request;

  late StreamController<DownloadFileResponse> controller;

  ///
  late CancelToken cancelToken;

  DownloadOperation({
    required this.name,
    required this.path,
    required this.fileId,
  }) {
    cancelToken = CancelToken();
    controller = StreamController<DownloadFileResponse>.broadcast();
  }

  ///
  Future<void> forward() async {
    ///
    request = DownloadFileRequest(
      fileId: fileId,
      controller: controller,
      filePath: path,
      cancelToken: cancelToken,
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

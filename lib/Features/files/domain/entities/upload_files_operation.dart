import 'dart:async';
import 'dart:io' as io;
import 'package:auhtify/Features/files/domain/requests/upload_file_request.dart';
import 'package:auhtify/Features/files/domain/usecases/upload_file_usecase.dart';
import 'package:dio/dio.dart';

import '../../../../core/injection/app_injection.dart';
import '../../data/responses/upload_file_response.dart';

class UploadFileOperation {
  ///
  String name;

  ///
  final io.File file;

  ///
  late UploadFileRequest request;

  ///
  late StreamController<UploadFileResponse> controller;

  ///
  late CancelToken cancelToken;
  UploadFileOperation({
    required this.name,
    required this.file,
  }) {
    cancelToken = CancelToken();
    controller = StreamController<UploadFileResponse>.broadcast();
  }

  ///
  Future<void> forward() async {
    request = UploadFileRequest(
      file: file,
      controller: controller,
      cancelToken: cancelToken,
    );

    ///
    await sl<UploadFileUseCase>().call(request: request);

    return;
  }

  ///
  Future<void> cancel() async {
    /// cancel operation
    request.subscription.cancel();

    /// delete file
    await file.delete();
  }
}

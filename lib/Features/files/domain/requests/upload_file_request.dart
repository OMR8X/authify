import 'dart:async';
import 'dart:io';

import 'package:auhtify/Features/files/data/responses/upload_file_response.dart';
import 'package:dio/dio.dart';

class UploadFileRequest {
  ///
  final File file;

  ///
  final StreamController<UploadFileResponse> controller;

  ///
  late StreamSubscription subscription;

  ///
  final CancelToken cancelToken;

  UploadFileRequest({
    required this.file,
    required this.controller,
    required this.cancelToken,
  });
}

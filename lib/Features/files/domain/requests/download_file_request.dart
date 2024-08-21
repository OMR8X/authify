import 'dart:async';

import 'package:dio/dio.dart';

import '../../data/responses/download_file_response.dart';

class DownloadFileRequest {
  ///
  final String fileId;

  ///
  final String filePath;

  ///
  final StreamController<DownloadFileResponse> controller;

  ///
  late StreamSubscription subscription;
  //
  final CancelToken? cancelToken;

  ///
  DownloadFileRequest({
    required this.fileId,
    required this.controller,
    required this.filePath,
    required this.cancelToken,
  });
}

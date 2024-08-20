import 'dart:async';

import 'package:flutter/foundation.dart';

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

  ///
  DownloadFileRequest({
    required this.fileId,
    required this.controller,
    required this.filePath,
  });
}

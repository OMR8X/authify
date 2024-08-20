import 'dart:io';

class UploadFileRequest {
  ///
  final File file;

  ///
  final String fileName;

  ///
  final String fileId;

  UploadFileRequest({
    required this.file,
    required this.fileName,
    required this.fileId,
  });
}

import 'package:dio/dio.dart';

class UploadFileResponse {
  final int total;
  final int sent;
  final double progress;
  UploadFileResponse({
    required this.total,
    required this.sent,
    required this.progress,
  });
}

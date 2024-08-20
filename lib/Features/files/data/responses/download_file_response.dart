class DownloadFileResponse {
  final int localBytesLength;
  final int contentLength;
  final double percent;

  DownloadFileResponse({
    required this.localBytesLength,
    required this.contentLength,
    required this.percent,
  });
}

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class FileDownloader {
  final Dio _dio = Dio();

  Future<void> downloadFile(String url, String fileName) async {
    try {
      // Get the application's directory for storing the file
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String savePath = "${appDocDir.path}/$fileName";

      // Check if the file already exists and get its length
      File file = File(savePath);
      int existingLength = 0;
      if (file.existsSync()) {
        existingLength = file.lengthSync();
      }

      // Set headers to continue downloading from where it left off, if applicable
      Response response = await _dio.get(
        url,
        options: Options(
          responseType: ResponseType.stream,
          headers: existingLength > 0
              ? {HttpHeaders.rangeHeader: "bytes=$existingLength-"}
              : null,
        ),
      );

      // Open the file in append mode to continue downloading
      var raf = file.openSync(mode: FileMode.append);

      // Listen for data and write it to the file
      int totalBytes = existingLength;
      int contentLength = int.parse(
          response.headers.value(HttpHeaders.contentLengthHeader) ?? '0');

      // Adjust content length for partial download
      if (response.statusCode == 206) {
        contentLength += existingLength;
      }

      await for (var chunk in response.data.stream) {
        raf.writeFromSync(chunk);
        totalBytes += chunk.length as int;

        print(
            "Download progress: ${((totalBytes / contentLength) * 100).toStringAsFixed(0)}%");
      }

      await raf.close();

      if (totalBytes == contentLength) {
        print("Download completed!");
      } else {
        print("Download paused or incomplete.");
      }
    } catch (e) {
      print("Error during download: $e");
    }
  }
}

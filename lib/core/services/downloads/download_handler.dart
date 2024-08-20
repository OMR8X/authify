// import 'dart:async';
// import 'dart:io';

// import 'package:auhtify/Features/files/data/responses/download_file_response.dart';
// import 'package:auhtify/Features/files/domain/requests/download_file_request.dart';
// import 'package:auhtify/core/services/api/api_constants.dart';
// import 'package:auhtify/core/services/downloads/download_operation.dart';
// import '../../../Features/files/data/datasources/files_remote_datasource.dart';

// class DownloadHandler {
//   ///
//   final FilesRemoteDataSource filesRemoteDataSource;

//   ///
//   DownloadHandler({
//     required this.filesRemoteDataSource,
//   });

//   ///
//   Future<void> downloadFile({
//     required String fileId,
//     required String filePath,
//   }) async {
//     final File file = File(filePath);
//     //
//     final request = createRequest(file, fileId);

//     try {
//       ///
//       /// Start download
//       final downloadResponse = await filesRemoteDataSource.downloadFile(
//         request: request,
//       );

//       /// Handle the response and write the file
//       await _handleDownloadResponse(
//         downloadResponse: downloadResponse,
//         file: file,
//         existingLength: request.existingLength,
//       );
//     } catch (e) {}
//   }

//   Future<void> _handleDownloadResponse({
//     required DownloadFileResponse downloadResponse,
//     required File file,
//     required int existingLength,
//   }) async {
//     try {
//       ///
//       var raf = file.openSync(mode: FileMode.append);

//       const contentLengthHeader = HttpHeaders.contentLengthHeader;
//       final header = downloadResponse.response.headers;
//       int contentLength = int.parse(
//         header.value(contentLengthHeader) ?? '0',
//       );

//       if (downloadResponse.response.statusCode == 206) {
//         contentLength += existingLength;
//       }

//       await for (var chunk in downloadResponse.response.data.stream) {
//         raf.writeFromSync(chunk);
//       }

//       await raf.close();

//       if (existingLength != contentLength && contentLength != 0) {
//         throw Exception('Download incomplete');
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }

//   DownloadFileRequest createRequest(File file, String fileId) {
//     int existingLength = file.existsSync() ? file.lengthSync() : 0;
//     return DownloadFileRequest(
//       fileId: fileId,
//       existingLength: existingLength,
//     );
//   }

//   ///
//   void dispose() {

//   }
// }

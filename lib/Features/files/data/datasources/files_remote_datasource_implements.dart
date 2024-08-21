import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:auhtify/Features/files/data/datasources/files_remote_datasource.dart';
import 'package:auhtify/Features/files/data/responses/download_file_response.dart';
import 'package:auhtify/Features/files/data/responses/get_all_files_response.dart';
import 'package:auhtify/Features/files/data/responses/upload_file_response.dart';
import 'package:auhtify/Features/files/domain/requests/download_file_request.dart';
import 'package:auhtify/Features/files/domain/requests/get_all_files_request.dart';
import 'package:auhtify/core/services/api/api_constants.dart';
import 'package:auhtify/core/services/api/api_manager.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domain/requests/upload_file_request.dart';

class FilesRemoteDataSourceImplements extends FilesRemoteDataSource {
  final ApiManager manager;

  FilesRemoteDataSourceImplements({required this.manager});
  @override
  Future<Unit> uploadFile({
    required UploadFileRequest request,
  }) async {
    try {
      /// Prepare the file as a FormData object
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          request.file.path,
          filename: request.file.path.split("/").last,
        ),
        "name": request.file.path.split('/').last.split(".").first,
      });

      /// Prepare the headers
      final headers = {
        "Content-Type": "multipart/form-data",
      };

      /// Perform the HTTP POST request
      Response response = await manager().post(
        ApiUris.uploadFile,
        requireAuth: true,
        body: formData,
        responseType: ResponseType.json,
        headers: headers,
        cancelToken: request.cancelToken,
        onSendProgress: (int sent, int total) {
          double progress = (sent / total) * 100;

          request.controller.add(
            UploadFileResponse(
              total: total,
              sent: sent,
              progress: progress,
            ),
          );
        },
      );

      /// Check the response status and parse the response
      if (response.statusCode == 200) {
        request.controller.close();
        return unit;
      } else {
        throw Exception("Failed to upload file: ${response.statusCode}");
      }
    } catch (e) {
      /// Handle errors
      throw Exception("Error uploading file: $e");
    }
  }

  @override
  Future<Unit> downloadFile({
    required DownloadFileRequest request,
  }) async {
    ///
    /// Prepare file
    File file = File(request.filePath);

    /// Calculate file local bytes length
    int localBytesLength = 0;
    if (await file.exists()) {
      localBytesLength = await file.length();
    }

    ///
    /// Prepare RandomAccessFile
    final randomAccessFile = file.openSync(mode: FileMode.append);

    ///
    /// prepare headers
    Map<String, dynamic>? headers = {};

    /// check if file contain previous data
    if (localBytesLength != 0) {
      headers = {HttpHeaders.rangeHeader: "bytes=$localBytesLength-"};
    }

    /// prepare http connection
    Response response = await manager().get(
      ApiUris.downloadFile(request.fileId),
      headers: headers,
      responseType: ResponseType.stream,
      cancelToken: request.cancelToken,
    );

    /// get file full length
    int contentLength = int.parse(
      response.headers.value(HttpHeaders.contentLengthHeader) ?? '0',
    );

    /// prepare stream
    final stream = (response.data.stream as Stream<Uint8List>);

    ///
    request.subscription = stream.listen(
      (chunk) {
        /// Write bytes to file
        randomAccessFile.writeFromSync(chunk);

        /// Update localBytesLength
        localBytesLength += chunk.length;

        /// emit changes
        request.controller.add(
          DownloadFileResponse(
            localBytesLength: localBytesLength,
            contentLength: contentLength,
            percent: localBytesLength / contentLength,
          ),
        );
      },
    );

    ///
    await request.subscription.asFuture();

    ///
    await randomAccessFile.close();

    ///
    await request.controller.close();

    ///
    return unit;
  }

  @override
  Future<GetAllFilesResponse> getAllFiles({
    required GetAllFilesRequest request,
  }) async {
    ///
    Map<String, dynamic> queryParameters = {};

    ///
    if (request.page != null) {
      queryParameters['page'] = request.page;
    }

    ///
    if (request.fileExtension != null) {
      queryParameters['extension'] = request.fileExtension;
    }

    ///
    if (request.search != null) {
      queryParameters['search'] = request.search;
    }

    ///
    if (request.perPage != null) {
      queryParameters['per_page'] = request.perPage;
    }

    /// Perform the HTTP POST request
    Response response = await manager().get(
      ApiUris.getAllFiles,
      requireAuth: true,
      queryParameters: queryParameters,
    );

    return GetAllFilesResponse.fromJson(response.data);
  }
}

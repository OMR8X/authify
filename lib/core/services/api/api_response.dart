import 'package:dio/dio.dart';

import '../../resources/errors/exceptions.dart';

class ApiResponse {
  //
  final bool? status;
  //
  final String message;
  // hold incoming data from response
  final Map<String, dynamic>? data;
  // hold any errors details
  final Map<String, dynamic>? errors;

  ApiResponse({
    required this.status,
    required this.errors,
    required this.message,
    required this.data,
  });

  bool get hasError {
    return (status == false) || (errors?.isNotEmpty ?? false);
  }

  dynamic getData({required String key}) {
    if (data?[key] == null) {
      throw const ServerException();
    }
    return data?[key] ?? {};
  }

  String getMessage() {
    //
    String details = message;
    //
    if (errors != null || errors != {}) {
      //
      details += ' : \n';
      //
      (errors ?? {}).forEach((key, value) {
        details += (value as List).first;
      });
      //
    }
    //
    return details;
  }

  factory ApiResponse.fromDioResponse(Response response) {
    return ApiResponse(
      data: response.data["data"],
      status: response.data["status"],
      errors: response.data["errors"],
      message: response.data["message"],
    );
  }
}

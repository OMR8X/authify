import 'package:auhtify/core/resources/errors/exceptions.dart';
import 'package:dio/dio.dart';

class AuthResponse {
  //
  final bool? status;
  //
  final String message;
  // hold incoming data from response
  final Map<String, dynamic>? data;
  // hold any errors details
  final Map<String, dynamic>? errors;

  AuthResponse({
    required this.status,
    required this.errors,
    required this.message,
    required this.data,
  });

  bool get hasError {
    return (status == false) || (errors?.isNotEmpty ?? false);
  }

  Map<String, dynamic> getData({required String key}) {
    if (data?[key] == null) {
      throw const ServerException();
    }
    return data?[key] ?? {};
  }

  factory AuthResponse.fromDioResponse(Response response) {
    return AuthResponse(
      data: response.data["data"],
      status: response.data["status"],
      errors: response.data["errors"],
      message: response.data["message"],
    );
  }
}

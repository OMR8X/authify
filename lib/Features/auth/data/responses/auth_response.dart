import 'package:auhtify/core/resources/errors/exceptions.dart';
import 'package:dio/dio.dart';

class AuthResponse {
  //
  final bool status;
  // hold response message
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
    return errors?.isNotEmpty ?? false;
  }

  Map<String, dynamic> getData({required String key}) {
    if (data?[key] == null) {
      throw const ServerException();
    }
    return data?[key] ?? {};
  }

  factory AuthResponse.fromDioResponse(Response response) {
    return AuthResponse(
      status: response.data["status"],
      data: response.data["data"],
      errors: response.data["errors"],
      message: response.data["message"],
    );
  }
}

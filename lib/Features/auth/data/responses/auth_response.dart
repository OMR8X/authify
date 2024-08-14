import 'package:dio/dio.dart';

class AuthResponse {
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

  factory AuthResponse.fromDioResponse(Response response) {
    return AuthResponse(
      status: response.data["status"],
      data: response.data["data"],
      errors: response.data["errors"],
      message: response.data["message"],
    );
  }
}

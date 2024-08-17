import 'dart:core';

class ServerException implements Exception {
  final String message;
  const ServerException({this.message = ""});
}

class AuthException implements Exception {
  final String message;
  const AuthException({required this.message});
}

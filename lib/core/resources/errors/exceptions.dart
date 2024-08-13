import 'dart:core';

class ServerException implements Exception {
  const ServerException();
}

class AuthException implements Exception {
  final String message;
  const AuthException({required this.message});
}

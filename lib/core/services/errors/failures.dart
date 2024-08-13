import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String code;
  final String message;

  const Failure({required this.code, required this.message});

  @override
  List<Object?> get props => [code, message];

  String toText() {
    return "$message [$code!]";
  }
}

class AnonFailure extends Failure {
  static const String _code = "";
  static const String _message = "Anon Failure";

  const AnonFailure() : super(message: _message, code: _code);
}

class NoInternetFailure extends Failure {
  static const String _code = "";
  static const String _message = "No internet connection";

  const NoInternetFailure() : super(message: _message, code: _code);
}

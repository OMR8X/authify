import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  const Failure();
  @override
  List<Object?> get props => [];
}

class AnonFailure extends Failure {
  static const String message = "حصل خطأ غير معروف";
  @override
  List<Object?> get props => [message];

  const AnonFailure();
}

class ServerFailure extends Failure {
  final String message;

  @override
  List<Object?> get props => [message];

  const ServerFailure({String? message})
      : message = message ?? "حصل خطأ اثناء الاتصال بالخادم";
}

class TimeOutFailure extends Failure {
  static const String message = "انتهت فترة الاتصال بالخادم";
  @override
  List<Object?> get props => [message];
  const TimeOutFailure();
}

class AuthFailure extends Failure {
  final String message;

  const AuthFailure({required this.message});

  @override
  List<Object?> get props => [message];
}

class NoInternetFailure extends Failure {
  static const String message = "لا يوجد اتصال بالانترنت";
  @override
  List<Object?> get props => [message];
}

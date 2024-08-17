import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class AnonFailure extends Failure {
  static const String _defaultMessage = "حصل خطأ غير معروف";

  const AnonFailure() : super(_defaultMessage);
}

class ServerFailure extends Failure {
  const ServerFailure({String? message})
      : super(message ?? "حصل خطأ اثناء الاتصال بالخادم");
}

class TimeOutFailure extends Failure {
  static const String _defaultMessage = "انتهت فترة الاتصال بالخادم";

  const TimeOutFailure() : super(_defaultMessage);
}

class AuthFailure extends Failure {
  const AuthFailure({required String message}) : super(message);
}

class NoInternetFailure extends Failure {
  static const String _defaultMessage = "لا يوجد اتصال بالانترنت";

  const NoInternetFailure() : super(_defaultMessage);
}

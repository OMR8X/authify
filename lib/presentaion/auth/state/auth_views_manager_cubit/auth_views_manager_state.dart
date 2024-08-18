part of 'auth_views_manager_cubit.dart';

abstract class AuthState extends Equatable {
  final bool loading;
  final String? message;
  const AuthState({
    required this.message,
    required this.loading,
  });

  @override
  List<Object?> get props => [message, loading];
}

class AuthWelcome extends AuthState {
  const AuthWelcome({
    super.message,
    super.loading = false,
  });
}

class AuthLoading extends AuthState {
  const AuthLoading({
    super.message,
    super.loading = false,
  });
}

class AuthSignUp extends AuthState {
  const AuthSignUp({
    super.message,
    super.loading = false,
  });
}

class AuthSignIn extends AuthState {
  const AuthSignIn({
    super.message,
    super.loading = false,
  });
}

class AuthForgetPassword extends AuthState {
  const AuthForgetPassword({
    super.message,
    super.loading = false,
  });
}

class AuthChangePassword extends AuthState {
  const AuthChangePassword({
    super.message,
    super.loading = false,
  });
}

class AuthDone extends AuthState {
  const AuthDone({
    super.message,
    super.loading = false,
  });
}

part of 'auth_views_manager_cubit.dart';

abstract class AuthState extends Equatable {
  final bool loading;
  final String? error;
  const AuthState({
    required this.error,
    required this.loading,
  });

  @override
  List<Object?> get props => [error, loading];
}

class AuthWelcome extends AuthState {
  const AuthWelcome({
    super.error,
    super.loading = false,
  });
}

class AuthSignUp extends AuthState {
  const AuthSignUp({
    super.error,
    super.loading = false,
  });
}

class AuthSignIn extends AuthState {
  const AuthSignIn({
    super.error,
    super.loading = false,
  });
}

class AuthForgetPassword extends AuthState {
  const AuthForgetPassword({
    super.error,
    super.loading = false,
  });
}

class AuthChangePassword extends AuthState {
  const AuthChangePassword({
    super.error,
    super.loading = false,
  });
}

class AuthDone extends AuthState {
  const AuthDone({
    super.error,
    super.loading = false,
  });
}

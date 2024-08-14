part of 'auth_views_manager_cubit.dart';

abstract class AuthViewsManagerState extends Equatable {
  const AuthViewsManagerState();

  @override
  List<Object> get props => [];
}

class AuthViewsManagerInitial extends AuthViewsManagerState {}

class AuthViewsManagerLoading extends AuthViewsManagerState {}

class AuthViewsManagerSuccess extends AuthViewsManagerState {}

class AuthViewsManageFailure extends AuthViewsManagerState {
  final String errMessage;

  const AuthViewsManageFailure(this.errMessage);
}

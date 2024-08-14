// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_views_manager_state.dart';

class AuthViewsManagerCubit extends Cubit<AuthViewsManagerState> {
  AuthViewsManagerCubit() : super(AuthViewsManagerInitial());
}

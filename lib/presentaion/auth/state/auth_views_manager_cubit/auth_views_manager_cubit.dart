// ignore: depend_on_referenced_packages
import 'package:auhtify/Features/auth/domain/requests/change_password_request.dart';
import 'package:auhtify/Features/auth/domain/requests/forget_password_request.dart';
import 'package:auhtify/Features/auth/domain/requests/sign_in_request.dart';
import 'package:auhtify/Features/auth/domain/requests/sign_up_request.dart';
import 'package:auhtify/Features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:auhtify/Features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:auhtify/core/injection/app_injection.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'auth_views_manager_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthWelcome());

  //
  init() {
    showWelcome();
  }

  //
  showWelcome() {
    emit(const AuthWelcome());
  }

  // sign up section
  showSignUp() {
    emit(const AuthSignUp());
  }

  signUp(SignUpRequest request) async {
    //
    emit(const AuthSignUp(loading: true));
    //
    final response = await sl<SignUpUseCase>().call(
      request: request,
    );
    //
    response.fold(
      (l) {
        emit(AuthSignUp(error: l.message));
      },
      (r) {
        emit(const AuthSignUp(error: "تم انشاء حساب"));
      },
    );
  }

  // sign in section
  showSignIn() {
    emit(const AuthSignIn());
  }

  signIn(SignInRequest request) async {
    //
    emit(const AuthSignIn(loading: true));
    //
    final response = await sl<SignInUseCase>().call(
      request: request,
    );
    //
    response.fold(
      (l) {
        emit(AuthSignIn(error: l.message));
      },
      (r) {
        emit(const AuthSignIn(error: "تم تسجيل الدخول"));
      },
    );
  }

  // forget password section
  showForgetPassword() {
    emit(const AuthForgetPassword());
  }

  forgetPassword(ForgetPasswordRequest request) {}

  //
  showChangePassword() {
    emit(const AuthChangePassword());
  }

  changePassword(ChangePasswordRequest request) {}
}

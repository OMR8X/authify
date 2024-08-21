// ignore: depend_on_referenced_packages
import 'package:auhtify/Features/auth/domain/entites/user_data.dart';
import 'package:auhtify/Features/auth/domain/requests/change_password_request.dart';
import 'package:auhtify/Features/auth/domain/requests/forget_password_request.dart';
import 'package:auhtify/Features/auth/domain/requests/get_user_data_request.dart';
import 'package:auhtify/Features/auth/domain/requests/sign_in_request.dart';
import 'package:auhtify/Features/auth/domain/requests/sign_out_request.dart';
import 'package:auhtify/Features/auth/domain/requests/sign_up_request.dart';
import 'package:auhtify/Features/auth/domain/usecases/change_password_usecase.dart';
import 'package:auhtify/Features/auth/domain/usecases/forget_password_usecase.dart';
import 'package:auhtify/Features/auth/domain/usecases/get_user_data_usecase.dart';
import 'package:auhtify/Features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:auhtify/Features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:auhtify/Features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:auhtify/core/injection/app_injection.dart';
import 'package:auhtify/core/services/tokens/tokens_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_views_manager_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthWelcome());
  //
  UserData? userData;
  //
  init() async {
    //
    emit(const AuthLoading());
    //
    if (TokenManager.instance.token != null) {
      showHome();
    } else {
      showWelcome();
    }
  }

  showHome() async {
    //
    // check if user is already signed in and there is user data
    if (userData != null) {
      emit(const AuthDone());
      return;
    }
    //

    // get user data
    final response = await sl<GetUserDataUseCase>().call(
      request: GetUserDataRequest(),
    );
    //
    response.fold(
      (l) {
        emit(AuthWelcome(message: l.message));
      },
      (r) async {
        //
        await TokenManager.instance.setToken(newToken: r.token);
        //
        injectUserData(r.user);
        //
        emit(const AuthDone());
      },
    );
  }

  showWelcome() {
    emit(const AuthWelcome());
  }

  injectUserData(UserData userData) {
    this.userData = userData;
  }

  //
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
        emit(AuthSignUp(message: l.message));
      },
      (r) async {
        //
        if (request.keepLoggedIn) {
          await TokenManager.instance.setToken(newToken: r.token);
        } else {
          await TokenManager.instance.setToken(
            newToken: r.token,
            tempLog: true,
          );
        }
        //
        injectUserData(r.user);
        //
        emit(const AuthDone(message: "account created successfully"));
        //
      },
    );
  }

  //
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
        emit(AuthSignIn(message: l.message));
      },
      (r) async {
        //
        if (request.keepLoggedIn) {
          await TokenManager.instance.setToken(newToken: r.token);
        } else {
          await TokenManager.instance.setToken(
            newToken: r.token,
            tempLog: true,
          );
        }
        //
        print(TokenManager.instance.token);
        //
        injectUserData(r.user);
        //
        emit(AuthDone(message: r.message));
      },
    );
  }

  //
  // forget password section
  showForgetPassword() {
    emit(const AuthForgetPassword());
  }

  forgetPassword(ForgetPasswordRequest request) async {
    //
    emit(const AuthForgetPassword(loading: true));
    //
    final response = await sl<ForgetPasswordUseCase>().call(
      request: request,
    );
    //
    response.fold(
      (l) {
        emit(AuthForgetPassword(message: l.message));
      },
      (r) {
        emit(const AuthChangePassword(message: "code send successfully"));
      },
    );
  }

  //
  // change password section
  showChangePassword() {
    emit(const AuthChangePassword());
  }

  changePassword(ChangePasswordRequest request) async {
    //
    emit(const AuthChangePassword(loading: true));
    //
    final response = await sl<ChangePasswordUseCase>().call(
      request: request,
    );
    //
    response.fold(
      (l) {
        emit(AuthChangePassword(message: l.message));
      },
      (r) {
        emit(
          const AuthChangePassword(message: "password changed successfully"),
        );
        init();
      },
    );
  }

  //
  signOut() async {
    //
    emit(const AuthLoading());
    //
    // get user token

    //
    final response = await sl<SignOutUseCase>().call(
      request: SignOutRequest(),
    );
    //
    response.fold(
      (l) {
        emit(AuthDone(message: l.message));
      },
      (r) {
        TokenManager.instance.deleteToken();
        emit(const AuthWelcome(message: "logged out successfully"));
      },
    );
  }
}

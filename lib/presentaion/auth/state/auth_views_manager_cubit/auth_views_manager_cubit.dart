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
  String? tempToken;
  //
  late UserData userData;
  //
  init() async {
    //
    emit(const AuthLoading());
    //
    if ((tempToken ?? await TokenManager.instance.getToken()) != null) {
      showHome();
    } else {
      showWelcome();
    }
  }

  showHome() async {
    // get user token
    String token = (tempToken ?? await TokenManager.instance.getToken())!;
    // get user data
    final response = await sl<GetUserDataUseCase>().call(
      request: GetUserDataRequest(token: token),
    );
    //
    response.fold(
      (l) {
        emit(AuthWelcome(message: l.message));
      },
      (r) async {
        //
        await TokenManager.instance.setToken(r.token);
        //
        emit(const AuthDone());
      },
    );
  }

  injectUserData(UserData userData) {}
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
        emit(AuthSignUp(message: l.message));
      },
      (r) async {
        //
        if (request.keepLoggedIn) {
          await TokenManager.instance.setToken(r.token);
        } else {
          tempToken = r.token;
        }
        //
        emit(const AuthDone(message: "account created successfully"));
        //
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
        emit(AuthSignIn(message: l.message));
      },
      (r) async {
        //
        if (request.keepLoggedIn) {
          await TokenManager.instance.setToken(r.token);
        } else {
          tempToken = r.token;
        }
        //
        emit(const AuthDone(message: "logged in successfully"));
      },
    );
  }

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
        emit(const AuthSignIn(message: "password changed successfully"));
      },
    );
  }

  //
  signOut() async {
    //
    emit(const AuthLoading());
    //
    // get user token
    String token = (tempToken ?? await TokenManager.instance.getToken())!;
    //
    final response = await sl<SignOutUseCase>().call(
      request: SignOutRequest(token: token),
    );
    //
    response.fold(
      (l) {
        emit(AuthDone(message: l.message));
      },
      (r) {
        tempToken = null;
        emit(const AuthWelcome(message: "logged out successfully"));
      },
    );
  }
}

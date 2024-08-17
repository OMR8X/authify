import 'package:auhtify/Features/auth/domain/repositories/auth_repository.dart';
import 'package:auhtify/Features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:auhtify/core/injection/app_injection.dart';
import 'package:auhtify/core/resources/styles/colors_resources.dart';
import 'package:auhtify/presentaion/auth/state/auth_views_manager_cubit/auth_views_manager_cubit.dart';
import 'package:auhtify/presentaion/auth/views/change_password_view.dart';
import 'package:auhtify/presentaion/auth/views/forget_password_view.dart';
import 'package:auhtify/presentaion/auth/views/sign_in_view.dart';
import 'package:auhtify/presentaion/auth/views/sign_up_view.dart';
import 'package:auhtify/presentaion/auth/views/welcom_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthViewsManager extends StatefulWidget {
  const AuthViewsManager({super.key});

  @override
  State<AuthViewsManager> createState() => _AuthViewsManagerState();
}

class _AuthViewsManagerState extends State<AuthViewsManager> {
  @override
  void initState() {
    context.read<AuthCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.error != null) {
          Fluttertoast.showToast(
            msg: state.error!,
            backgroundColor: ColorsResources.background,
            textColor: ColorsResources.whiteText,
            fontSize: 16.0,
          );
        }
      },
      builder: (context, state) {
        if (state is AuthWelcome) {
          return WelcomeView(
            onPressSignIn: () {
              cubit.showSignIn();
            },
            onPressSignUp: () {
              cubit.showSignUp();
            },
          );
        } else if (state is AuthSignUp) {
          return SignUpView(
            state: state,
            onSignUp: cubit.signUp,
            onPressPop: () {
              cubit.showWelcome();
            },
          );
        } else if (state is AuthSignIn) {
          return SignInView(
            state: state,
            onSignIn: cubit.signIn,
            onPressResetPassword: () {
              cubit.showForgetPassword();
            },
            onPressPop: () {
              cubit.showWelcome();
            },
          );
        } else if (state is AuthForgetPassword) {
          return ForgetPasswordView(
            state: state,
            onPressPop: () {
              cubit.showWelcome();
            },
            onResetPassword: cubit.forgetPassword,
          );
        } else if (state is AuthChangePassword) {
          return ChangePasswordView(
            state: state,
            onChangePassword: cubit.changePassword,
            onPressPop: () {
              cubit.showWelcome();
            },
          );
        } else if (state is AuthDone) {
          return const CupertinoActivityIndicator();
        } else {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
      },
    );
  }
}

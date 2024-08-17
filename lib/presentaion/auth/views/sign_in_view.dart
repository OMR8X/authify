import 'dart:math';

import 'package:auhtify/Features/auth/domain/requests/sign_in_request.dart';
import 'package:auhtify/core/resources/styles/sizes_resources.dart';
import 'package:auhtify/core/widgets/ui/fields/text_form_field_widget.dart';
import 'package:auhtify/presentaion/auth/state/auth_views_manager_cubit/auth_views_manager_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/helpers/input_validator.dart';
import '../../../core/resources/styles/colors_resources.dart';
import '../../../core/widgets/ui/fields/button_widget.dart';
import '../../../core/widgets/ui/fields/check_title_widget.dart';
import '../../../core/widgets/ui/shapes/triangle_widget.dart';

class SignInView extends StatefulWidget {
  const SignInView({
    super.key,
    required this.onPressPop,
    required this.onPressResetPassword,
    required this.onSignIn,
    required this.state,
  });
  final AuthSignIn state;
  final VoidCallback onPressPop;
  final Function(SignInRequest) onSignIn;
  final VoidCallback onPressResetPassword;
  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  //
  late final GlobalKey<FormState> _formKey;
  //
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  //
  bool keepLoggedIn = false;
  //
  @override
  void initState() {
    //
    _formKey = GlobalKey<FormState>();
    //
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    final signUpRequest = SignInRequest(
      email: email,
      password: password,
      keepLoggedIn: keepLoggedIn,
    );
    widget.onSignIn(signUpRequest);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            widget.onPressPop();
          },
          icon: const Icon(
            Icons.close,
            color: ColorsResources.whiteText,
          ),
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: const Alignment(-0.8, -0.95),
            child: AnimatedTriangleWidget(
              width: 35,
              height: 35,
              angle: -pi / 6,
              color: ColorsResources.colors[3],
            ),
          ),
          Align(
            alignment: const Alignment(0.8, -0.99),
            child: AnimatedTriangleWidget(
              width: 35,
              height: 35,
              angle: pi / 6,
              color: ColorsResources.colors[2],
            ),
          ),
          Align(
            alignment: const Alignment(-0.9, -0.3),
            child: AnimatedTriangleWidget(
              width: 35,
              height: 35,
              angle: -pi / 2.5,
              color: ColorsResources.colors[1],
            ),
          ),
          Align(
            alignment: const Alignment(0.8, -0.2),
            child: AnimatedTriangleWidget(
              width: 35,
              height: 35,
              angle: pi / 3,
              color: ColorsResources.colors[0],
            ),
          ),
          Center(
            child: Column(
              children: [
                Expanded(
                  flex: 89,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset("assets/images/sign-in.png",
                                width: 200),
                            const SizedBox(height: 30),
                            //
                            TextFormFieldWidget(
                              hintText: "email",
                              controller: _emailController,
                              validator: (text) {
                                return InputValidator.emailValidator(text);
                              },
                            ),
                            TextFormFieldWidget(
                              hintText: "password",
                              obscureText: true,
                              controller: _passwordController,
                              validator: (text) {
                                return InputValidator.passwordValidator(text);
                              },
                            ),
                            //
                            CheckTitleWidget(
                              value: keepLoggedIn,
                              onChange: (value) {
                                setState(() {
                                  keepLoggedIn = value;
                                });
                              },
                            ),
                            //
                            ButtonWidget(
                              title: "sign up",
                              loading: widget.state.loading,
                              foregroundColor: ColorsResources.primary,
                              textColor: ColorsResources.whiteText,
                              onPressed: () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  _submit();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 11,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                          text: "forget password ? ",
                          children: [
                            TextSpan(
                              text: "reset password",
                              recognizer: TapGestureRecognizer()
                                ..onTap = widget.onPressResetPassword,
                              style: const TextStyle(
                                color: ColorsResources.primary,
                              ),
                            ),
                          ],
                          style: const TextStyle(
                            color: ColorsResources.whiteText,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

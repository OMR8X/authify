import 'dart:math';

import 'package:auhtify/Features/auth/domain/requests/change_password_request.dart';
import 'package:auhtify/presentaion/auth/state/auth_views_manager_cubit/auth_views_manager_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/helpers/input_validator.dart';
import '../../../core/resources/styles/colors_resources.dart';
import '../../../core/resources/styles/sizes_resources.dart';
import '../../../core/widgets/text_title_widget.dart';
import '../../../core/widgets/ui/fields/button_widget.dart';
import '../../../core/widgets/ui/fields/text_form_field_widget.dart';
import '../../../core/widgets/ui/shapes/triangle_widget.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({
    super.key,
    required this.onPressPop,
    required this.onChangePassword,
    required this.state,
  });
  final VoidCallback onPressPop;
  final AuthChangePassword state;
  final Function(ChangePasswordRequest) onChangePassword;
  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  //
  late final GlobalKey<FormState> _formKey;
  //
  late final TextEditingController _codeController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  bool keepLoggedIn = false;
  @override
  void initState() {
    //
    _formKey = GlobalKey<FormState>();
    //
    _codeController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _codeController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    final String code = _codeController.text.trim();
    final String password = _passwordController.text.trim();

    final signUpRequest = ChangePasswordRequest(
      code: code,
      password: password,
    );
    widget.onChangePassword(signUpRequest);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: widget.onPressPop,
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
              color: ColorsResources.colors[4],
            ),
          ),
          Align(
            alignment: const Alignment(0.8, -0.99),
            child: AnimatedTriangleWidget(
              width: 35,
              height: 35,
              angle: pi / 6,
              color: ColorsResources.colors[3],
            ),
          ),
          Align(
            alignment: const Alignment(-0.9, -0.15),
            child: AnimatedTriangleWidget(
              width: 35,
              height: 35,
              angle: -pi / 4,
              color: ColorsResources.colors[2],
            ),
          ),
          Align(
            alignment: const Alignment(0.9, -0.2),
            child: AnimatedTriangleWidget(
              width: 35,
              height: 35,
              angle: pi / 4,
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
                            Image.asset(
                              "assets/images/change-password.png",
                              width: 200,
                            ),
                            const SizedBox(height: 50),
                            //
                            const TextTitleWidget(
                              title:
                                  "We've send you password reset code check your email",
                            ),
                            //
                            TextFormFieldWidget(
                              hintText: "code",
                              controller: _codeController,
                              validator: (text) {
                                return InputValidator.numberValidator(text);
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
                            TextFormFieldWidget(
                              hintText: "confirm password",
                              obscureText: true,
                              controller: _confirmPasswordController,
                              validator: (text) {
                                return InputValidator.passwordValidator(text);
                              },
                            ),
                            //
                            ButtonWidget(
                              title: "change password",
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
                const Expanded(
                  flex: 11,
                  child: Column(
                    children: [],
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

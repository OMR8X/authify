import 'package:auhtify/Features/auth/data/datasources/auth_data_source.dart';
import 'package:auhtify/Features/auth/domain/requests/sign_in_request.dart';
import 'package:auhtify/Features/auth/domain/requests/sign_up_request.dart';
import 'package:auhtify/Features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:auhtify/core/helpers/input_validator.dart';
import 'package:auhtify/core/services/api/api_constants.dart';
import 'package:auhtify/core/services/api/api_manager.dart';
import 'package:auhtify/core/widgets/ui/fields/check_title_widget.dart';
import 'package:auhtify/presentaion/auth/state/auth_views_manager_cubit/auth_views_manager_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../Features/auth/domain/repositories/auth_repository.dart';
import '../../../core/injection/app_injection.dart';
import '../../../core/resources/styles/colors_resources.dart';
import '../../../core/widgets/text_title_widget.dart';
import '../../../core/widgets/ui/fields/button_widget.dart';
import '../../../core/widgets/ui/fields/text_form_field_widget.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({
    super.key,
    required this.onPressPop,
    required this.onSignUp,
    required this.state,
  });
  final AuthSignUp state;

  final VoidCallback onPressPop;
  final Function(SignUpRequest) onSignUp;

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  //
  late final GlobalKey<FormState> _formKey;
  //
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    //
    _formKey = GlobalKey<FormState>();
    //
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
  _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    final String name = _nameController.text.trim();
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    final signUpRequest = SignUpRequest(
      name: name,
      email: email,
      password: password,
    );
    widget.onSignUp(signUpRequest);
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
      body: Center(
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
                        Image.asset("assets/images/sign-up.png", width: 200),
                        const SizedBox(height: 30),
                        //
                        TextFormFieldWidget(
                          hintText: "name",
                          controller: _nameController,
                          validator: (text) {
                            return InputValidator.nameValidator(text);
                          },
                        ),
                        TextFormFieldWidget(
                          hintText: "email",
                          controller: _emailController,
                          validator: (text) {
                            return InputValidator.emailValidator(text);
                          },
                        ),
                        TextFormFieldWidget(
                          hintText: "password",
                          controller: _passwordController,
                          validator: (text) {
                            return InputValidator.passwordValidator(text);
                          },
                        ),
                        TextFormFieldWidget(
                          hintText: "confirm password",
                          controller: _confirmPasswordController,
                          validator: (text) {
                            if (_passwordController.text !=
                                _confirmPasswordController.text) {
                              return "Passwords do not match";
                            }
                            return InputValidator.passwordValidator(text);
                          },
                        ),
                        //
                        const CheckTitleWidget(),
                        //
                        ButtonWidget(
                          title: "sign up",
                          loading: widget.state.loading,
                          foregroundColor: ColorsResources.primary,
                          textColor: ColorsResources.whiteText,
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
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
    );
  }
}

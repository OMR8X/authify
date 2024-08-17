import 'package:auhtify/Features/auth/domain/requests/forget_password_request.dart';
import 'package:auhtify/presentaion/auth/state/auth_views_manager_cubit/auth_views_manager_cubit.dart';
import 'package:flutter/material.dart';

import '../../../core/helpers/input_validator.dart';
import '../../../core/resources/styles/colors_resources.dart';
import '../../../core/widgets/text_title_widget.dart';
import '../../../core/widgets/ui/fields/button_widget.dart';
import '../../../core/widgets/ui/fields/text_form_field_widget.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({
    super.key,
    required this.onPressPop,
    required this.onResetPassword,
    required this.state,
  });
  final AuthForgetPassword state;
  final VoidCallback onPressPop;
  final Function(ForgetPasswordRequest) onResetPassword;
  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  //
  late final GlobalKey<FormState> _formKey;
  //
  late final TextEditingController _emailController;
  //
  @override
  void initState() {
    //
    _formKey = GlobalKey<FormState>();
    //
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _submit() {
    final String email = _emailController.text.trim();

    final signUpRequest = ForgetPasswordRequest(
      email: email,
    );
    widget.onResetPassword(signUpRequest);
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
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 89,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Spacer(),
                    Image.asset(
                      "assets/images/forget-password.png",
                      width: 200,
                    ),
                    const Spacer(),
                    //
                    const TextTitleWidget(
                      title: "Enter your email to change your password",
                    ),
                    //
                    TextFormFieldWidget(
                      hintText: "Email",
                      controller: _emailController,
                      validator: (text) {
                        return InputValidator.emailValidator(text);
                      },
                    ),
                    //
                    ButtonWidget(
                      title: "reset password",
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

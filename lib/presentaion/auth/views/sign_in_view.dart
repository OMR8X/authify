import 'package:auhtify/Features/auth/domain/requests/sign_in_request.dart';
import 'package:auhtify/core/resources/styles/sizes_resources.dart';
import 'package:auhtify/core/widgets/ui/fields/text_form_field_widget.dart';
import 'package:auhtify/presentaion/auth/state/auth_views_manager_cubit/auth_views_manager_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/styles/colors_resources.dart';
import '../../../core/widgets/ui/fields/button_widget.dart';
import '../../../core/widgets/ui/fields/check_title_widget.dart';

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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset("assets/images/sign-in.png", width: 200),
                      const SizedBox(height: 30),
                      //
                      const TextFormFieldWidget(
                        hintText: "Email",
                      ),
                      const TextFormFieldWidget(
                        hintText: "Password",
                      ),
                      //
                      const CheckTitleWidget(),
                      //
                      ButtonWidget(
                        title: "sign up",
                        loading: widget.state.loading,
                        foregroundColor: ColorsResources.primary,
                        textColor: ColorsResources.whiteText,
                        onPressed: () {},
                      ),
                    ],
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
    );
  }
}

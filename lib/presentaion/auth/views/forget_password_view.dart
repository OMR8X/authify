import 'package:auhtify/Features/auth/domain/requests/forget_password_request.dart';
import 'package:auhtify/core/resources/styles/sizes_resources.dart';
import 'package:auhtify/presentaion/auth/state/auth_views_manager_cubit/auth_views_manager_cubit.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/styles/colors_resources.dart';
import '../../../core/widgets/text_title_widget.dart';
import '../../../core/widgets/ui/fields/button_widget.dart';
import '../../../core/widgets/ui/fields/check_title_widget.dart';
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Spacer(),
                  Image.asset("assets/images/forget-password.png", width: 200),
                  const Spacer(),
                  //
                  const TextTitleWidget(
                      title: "Enter your email to change your password"),
                  //
                  const TextFormFieldWidget(
                    hintText: "Email",
                  ),
                  //
                  ButtonWidget(
                    title: "reset password",
                    loading: widget.state.loading,
                    foregroundColor: ColorsResources.primary,
                    textColor: ColorsResources.whiteText,
                    onPressed: () {},
                  ),
                ],
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

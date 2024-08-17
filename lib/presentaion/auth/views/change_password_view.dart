import 'package:auhtify/Features/auth/domain/requests/change_password_request.dart';
import 'package:auhtify/presentaion/auth/state/auth_views_manager_cubit/auth_views_manager_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/styles/colors_resources.dart';
import '../../../core/resources/styles/sizes_resources.dart';
import '../../../core/widgets/text_title_widget.dart';
import '../../../core/widgets/ui/fields/button_widget.dart';
import '../../../core/widgets/ui/fields/text_form_field_widget.dart';

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
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset("assets/images/change-password.png",
                          width: 200),
                      const SizedBox(height: 50),
                      //
                      const TextTitleWidget(
                        title:
                            "We've send you password reset code check your email",
                      ),
                      //
                      const TextFormFieldWidget(
                        hintText: "code",
                      ),
                      const TextFormFieldWidget(
                        hintText: "password",
                      ),
                      const TextFormFieldWidget(
                        hintText: "confirm password",
                      ),
                      //
                      ButtonWidget(
                        title: "change password",
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

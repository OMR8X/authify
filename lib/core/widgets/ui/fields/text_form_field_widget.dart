import 'package:flutter/material.dart';

import '../../../resources/styles/colors_resources.dart';
import '../../../resources/styles/sizes_resources.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.hintText,
    this.onSaved,
    this.validator,
    this.controller,
    this.obscureText = false,
  });
  final TextEditingController? controller;
  final String hintText;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: SizesResources.mainWidth(context),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: TextFormField(
            controller: controller,
            validator: validator,
            obscureText: obscureText,
            onSaved: onSaved,
            style: const TextStyle(
              fontSize: 12,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              hintText: hintText,
            ),
          ),
        ),
      ),
    );
  }
}

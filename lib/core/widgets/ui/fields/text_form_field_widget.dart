import 'package:flutter/material.dart';

import '../../../resources/styles/colors_resources.dart';
import '../../../resources/styles/sizes_resources.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({
    super.key,
    required this.hintText,
    this.onSaved,
    this.validator,
    this.controller,
    this.obscureText = false,
    this.textInputAction,
  });
  final TextEditingController? controller;
  final String hintText;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputAction? textInputAction;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: SizesResources.mainWidth(context),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: TextFormField(
            controller: widget.controller,
            validator: widget.validator,
            obscureText: widget.obscureText && obscureText,
            textInputAction: widget.textInputAction ?? TextInputAction.next,
            onSaved: widget.onSaved,
            style: const TextStyle(
              fontSize: 12,
            ),
            decoration: InputDecoration(
              suffixIcon: getSuffixIcon(),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              hintText: widget.hintText,
            ),
          ),
        ),
      ),
    );
  }

  Widget? getSuffixIcon() {
    if (widget.obscureText) {
      return IconButton(
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        icon: Icon(
          obscureText ? Icons.visibility_off : Icons.visibility,
          size: 19,
        ),
      );
    } else {
      return null;
    }
  }
}

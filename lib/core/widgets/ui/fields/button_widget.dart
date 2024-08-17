
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../resources/styles/sizes_resources.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({
    super.key,
    this.textColor,
    this.foregroundColor,
    this.onPressed,
    this.loading = false,
    required this.title,
  });
  final bool loading;
  final String title;
  final Color? textColor;
  final Color? foregroundColor;
  final VoidCallback? onPressed;
  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: SizedBox(
        width: SizesResources.mainWidth(context),
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.foregroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                8,
              ),
            ),
          ),
          onPressed: widget.loading ? null : widget.onPressed,
          child: widget.loading
              ? const CupertinoActivityIndicator()
              : Text(
                  widget.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: widget.textColor,
                  ),
                ),
        ),
      ),
    );
  }
}

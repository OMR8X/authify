import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../resources/styles/colors_resources.dart';
import '../resources/styles/sizes_resources.dart';

class TextTitleWidget extends StatelessWidget {
  const TextTitleWidget({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizesResources.mainWidth(context),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: ColorsResources.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

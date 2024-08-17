import 'package:flutter/material.dart';

import '../../../resources/styles/sizes_resources.dart';

class CheckTitleWidget extends StatelessWidget {
  const CheckTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: SizesResources.mainWidth(context),
        child: Row(
          children: [
            Checkbox(
              value: true,
              onChanged: (value) {},
            ),
            const Text("keep me logged in"),
          ],
        ),
      ),
    );
  }
}

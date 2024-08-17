import 'package:flutter/material.dart';

class SizesResources {
  static const double sidePadding = 20;
  //
  static double mainWidth(BuildContext context) {
    return MediaQuery.sizeOf(context).width - sidePadding;
  }
  //
}

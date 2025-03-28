import 'package:flutter/material.dart';

class CustomHelpers {
  CustomHelpers._();

  static bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}

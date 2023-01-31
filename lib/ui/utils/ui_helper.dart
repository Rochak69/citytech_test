import 'package:flutter/material.dart';

class UiHelper {
  static Widget verticalSpacing(double value) {
    return SizedBox(
      height: value,
    );
  }

  static Widget horizontalSpacing(double value) {
    return SizedBox(
      width: value,
    );
  }
}

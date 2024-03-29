import 'package:example/presentation/theme/color_constants.dart';
import 'package:flutter/material.dart';

final class ProjectBoxDecorations {
  static BoxDecoration customDecoration(Color? color) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color ?? ColorConstants.whiteGrey);
  }

  static BoxDecoration profileBoxDecoration() {
    return const BoxDecoration(
        color: ColorConstants.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          topLeft: Radius.circular(12),
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ));
  }
}

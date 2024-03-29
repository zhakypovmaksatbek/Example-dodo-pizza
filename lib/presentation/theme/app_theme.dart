import 'package:example/presentation/theme/color_constants.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorConstants.white,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: ColorConstants.white,
      elevation: 0,
    ),
  );
}

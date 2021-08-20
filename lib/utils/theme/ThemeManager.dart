import 'package:flutter/material.dart';
import 'package:ubuni_phone_app/globals/colors.dart';

class ThemeManager {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: lightScaffoldBackgroundColor,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      brightness: Brightness.dark,
      color: lightAppBarColor,
    ),
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: darkScaffoldBackgroundColor,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      brightness: Brightness.dark,
      color: darkAppBarColor,
    ),
  );
}
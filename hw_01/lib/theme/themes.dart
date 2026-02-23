import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hw_01/utils/constants.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: CColors.blue500,
    scaffoldBackgroundColor: CColors.grey50,

    colorScheme: const ColorScheme.light(
      primary: CColors.blue500,
      secondary: CColors.black,
      surface: CColors.grey50,
      onSurface: CColors.black,
    ),

    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: CColors.grey50,
        systemNavigationBarColor: CColors.grey50,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: CColors.blue500,
    scaffoldBackgroundColor: CColors.blue900,

    colorScheme: const ColorScheme.dark(
      primary: CColors.blue500,
      secondary: CColors.grey50,
      surface: CColors.blue900,
      onSurface: CColors.grey50,
    ),

    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: CColors.blue900,
        systemNavigationBarColor: CColors.blue900,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    ),
  );
}

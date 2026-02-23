import 'package:flutter/material.dart';
import 'package:hw_01/theme/dark_theme_prefs.dart';

class ThemeModel extends ChangeNotifier {
  DarkThemePrefs darkThemePrefs = DarkThemePrefs();

  bool _darkTheme = false;
  bool get getDarkTheme => _darkTheme;

  set setDarkTheme(bool value) {
    _darkTheme = value;
    darkThemePrefs.setDarkTheme(value);
    notifyListeners();
  }
}

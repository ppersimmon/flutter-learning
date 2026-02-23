import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePrefs {
  static const themeStatus = 'THEME_STATUS';

  void setDarkTheme(bool value) {
    SharedPreferences.getInstance().then((preferences) {
      preferences.setBool(themeStatus, value);
    });
  }

  Future<bool> getTheme() {
    return SharedPreferences.getInstance().then((preferences) {
      return preferences.getBool(themeStatus) ?? false;
    });
  }
}

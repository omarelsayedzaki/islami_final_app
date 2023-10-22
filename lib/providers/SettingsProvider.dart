import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// subject - observable - publisher
// data holder
class SettingsProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  String currentLocale = 'en';

  Future<void> changeTheme(ThemeMode newTheme) async {
    if (newTheme == currentTheme) {
      return;
    }
    currentTheme = newTheme; // data changed
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('theme', newTheme == ThemeMode.light ? 'light' : 'dark');
    notifyListeners();
  }

  String getMainBackground() {
    return currentTheme == ThemeMode.dark
        ? 'assets/images/main_background_dark.png'
        : 'assets/images/main_background.png';
  }

  bool isDarkEnabled() {
    return currentTheme == ThemeMode.dark;
  }

  void changeLocale(String newLocale) async {
    if (newLocale == currentLocale) return;
    currentLocale = newLocale;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('lang', newLocale);

    notifyListeners();
  }
}

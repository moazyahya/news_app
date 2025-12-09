import 'package:flutter/material.dart';

class AppSetteingProvider extends ChangeNotifier {
  ThemeMode currentThemeMode = ThemeMode.light;
  String currentLocale = "en";
  getThemeMode(ThemeMode mode) {
    currentThemeMode = mode;
    notifyListeners();
  }

  getAppLocal(String locale) {
    currentLocale = locale;
    notifyListeners();
  }
}

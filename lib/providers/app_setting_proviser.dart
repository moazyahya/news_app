import 'package:flutter/material.dart';

class AppSetteingProvider extends ChangeNotifier {
  ThemeMode currentThemeMode = ThemeMode.light;
  getThemeMode(ThemeMode mode) {
    currentThemeMode = mode;
    notifyListeners();
  }
}

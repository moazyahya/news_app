import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      color: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      centerTitle: true,
    ),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.white,
      primary: Colors.white,
      secondary: Colors.black,
    ),
    textTheme: _getTextStyele(Colors.black),
  );
  static ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      centerTitle: true,
    ),
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.black,
      primary: Colors.black,
      secondary: Colors.white,
    ),
    textTheme: _getTextStyele(Colors.white),
  );

  static TextTheme _getTextStyele(Color color) {
    return TextTheme(
      titleLarge: TextStyle(
        color: color,
        fontSize: 28,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        color: color,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      displayLarge: TextStyle(
        color: color,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: color,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: color,
        fontSize: 28,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: color,
        fontSize: 24,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

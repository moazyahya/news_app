import 'package:flutter/material.dart';
import 'package:news_app/common/theme/app_theme.dart';
import 'package:news_app/screens/main_layer_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      routes: {MainLayerScreen.routName: (_) => MainLayerScreen()},
      initialRoute: MainLayerScreen.routName,
    );
  }
}

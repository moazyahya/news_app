import 'package:flutter/material.dart';
import 'package:news_app/common/theme/app_theme.dart';
import 'package:news_app/common/providers/app_setting_proviser.dart';
import 'package:news_app/features/categories/views/main_layer_screen.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppSetteingProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],
      locale: Locale(Provider.of<AppSetteingProvider>(context).currentLocale),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: Provider.of<AppSetteingProvider>(context).currentThemeMode,
      routes: {MainLayerScreen.routName: (_) => MainLayerScreen()},
      initialRoute: MainLayerScreen.routName,
    );
  }
}

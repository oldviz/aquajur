import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'core/app_theme.dart';
import 'database/app_database.dart';
import 'screens/home_screen.dart';
import 'services/theme_service.dart';

class AquariumApp extends StatelessWidget {
  final AppDatabase db;
  final GlobalKey<NavigatorState>? navigatorKey;

  const AquariumApp({
    super.key,
    required this.db,
    this.navigatorKey,
  });

  @override
  Widget build(BuildContext context) {
    // ВАЖНО: Этот вызов требует, чтобы ThemeService был доступен через Provider выше в дереве.
    final themeService = context.watch<ThemeService>();

    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Aquarium Journal',
      debugShowCheckedModeBanner: false,
      
      locale: const Locale('ru'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ru'),
        Locale('en'),
      ],

      theme: AppThemes.buildLightTheme(),
      darkTheme: AppThemes.buildDarkTheme(),
      themeMode: _getThemeMode(themeService.mode),
      
      home: HomeScreen(db: db),
    );
  }

  ThemeMode _getThemeMode(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.system:
        return ThemeMode.system;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.light:
        return ThemeMode.light;
    }
  }
}
import 'package:flutter/material.dart';

enum AppThemeMode {
  system,
  dark,
  light,
}

extension AppThemeModeExtension on AppThemeMode {
  String get label {
    switch (this) {
      case AppThemeMode.system:
        return 'Системная';
      case AppThemeMode.dark:
        return 'Тёмная';
      case AppThemeMode.light:
        return 'Светлая';
    }
  }

  static AppThemeMode fromString(String? value) {
    switch (value) {
      case 'dark':
        return AppThemeMode.dark;
      case 'light':
        return AppThemeMode.light;
      case 'system':
      default:
        return AppThemeMode.system;
    }
  }

  String toStorageValue() {
    switch (this) {
      case AppThemeMode.system:
        return 'system';
      case AppThemeMode.dark:
        return 'dark';
      case AppThemeMode.light:
        return 'light';
    }
  }
}

abstract final class AppColors {
  // Темная тема
  static const scaffoldDark = Color(0xFF1A1A1A);
  static const sheetDark = Color(0xFF242424);
  static const tabBarDark = Color(0xFF0F1F2F);
  static const accentDark = Color(0xFF4DD0E1);
  static const positiveDark = Color(0xFF69F0AE);
  static const negativeDark = Color(0xFFFF5252);
  static const surfaceVariantDark = Color(0xFF2C2C2C);
  
  // Светлая тема
  static const scaffoldLight = Color(0xFFF5F5F5);
  static const sheetLight = Color(0xFFFFFFFF);
  static const tabBarLight = Color(0xFFE0E0E0);
  static const accentLight = Color(0xFF00838F);
  static const positiveLight = Color(0xFF2E7D32);
  static const negativeLight = Color(0xFFC62828);
  static const surfaceVariantLight = Color(0xFFEEEEEE);
}

class AppThemes {
  static ThemeData buildDarkTheme() {
    final base = ThemeData.dark();

    return base.copyWith(
      scaffoldBackgroundColor: AppColors.scaffoldDark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.accentDark,
        secondary: AppColors.accentDark,
        surface: AppColors.sheetDark,
        background: AppColors.scaffoldDark,
        error: AppColors.negativeDark,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.tabBarDark,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.sheetDark,
      ),
      // ИСПРАВЛЕНО: CardTheme -> CardThemeData
      cardTheme: const CardThemeData(
        color: AppColors.surfaceVariantDark,
        elevation: 2,
      ),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Colors.white12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.accentDark, width: 2),
        ),
        labelStyle: const TextStyle(color: Colors.white70),
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Colors.transparent,
      ),
      // ИСПРАВЛЕНО: TabBarTheme -> TabBarThemeData
      tabBarTheme: const TabBarThemeData(
        indicatorColor: AppColors.accentDark,
        labelColor: AppColors.accentDark,
        unselectedLabelColor: Colors.white54,
        labelStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
        unselectedLabelStyle: TextStyle(fontSize: 11),
      ),
      listTileTheme: ListTileThemeData(
        iconColor: AppColors.accentDark,
        textColor: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accentDark,
          foregroundColor: Colors.black,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.accentDark,
          side: const BorderSide(color: AppColors.accentDark),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.accentDark,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.accentDark,
        foregroundColor: Colors.black,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.surfaceVariantDark,
        contentTextStyle: const TextStyle(color: Colors.white),
      ),
      // ИСПРАВЛЕНО: DialogTheme -> DialogThemeData
      dialogTheme: const DialogThemeData(
        backgroundColor: AppColors.sheetDark,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        contentTextStyle: TextStyle(color: Colors.white70),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColors.accentDark,
      ),
    );
  }

  static ThemeData buildLightTheme() {
    final base = ThemeData.light();

    return base.copyWith(
      scaffoldBackgroundColor: AppColors.scaffoldLight,
      colorScheme: const ColorScheme.light(
        primary: AppColors.accentLight,
        secondary: AppColors.accentLight,
        surface: AppColors.sheetLight,
        background: AppColors.scaffoldLight,
        error: AppColors.negativeLight,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.tabBarLight,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.sheetLight,
      ),
      // ИСПРАВЛЕНО: CardTheme -> CardThemeData
      cardTheme: const CardThemeData(
        color: AppColors.surfaceVariantLight,
        elevation: 2,
      ),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.accentLight, width: 2),
        ),
        labelStyle: TextStyle(color: Colors.grey.shade700),
        hintStyle: TextStyle(color: Colors.grey.shade500),
        filled: true,
        fillColor: Colors.transparent,
      ),
      // ИСПРАВЛЕНО: TabBarTheme -> TabBarThemeData
      tabBarTheme: const TabBarThemeData(
        indicatorColor: AppColors.accentLight,
        labelColor: AppColors.accentLight,
        unselectedLabelColor: Colors.grey,
        labelStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
        unselectedLabelStyle: TextStyle(fontSize: 11),
      ),
      listTileTheme: ListTileThemeData(
        iconColor: AppColors.accentLight,
        textColor: Colors.black87,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accentLight,
          foregroundColor: Colors.white,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.accentLight,
          side: const BorderSide(color: AppColors.accentLight),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.accentLight,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.accentLight,
        foregroundColor: Colors.white,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.surfaceVariantLight,
        contentTextStyle: const TextStyle(color: Colors.black87),
      ),
      // ИСПРАВЛЕНО: DialogTheme -> DialogThemeData
      dialogTheme: const DialogThemeData(
        backgroundColor: AppColors.sheetLight,
        titleTextStyle: TextStyle(
          color: Colors.black87,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        contentTextStyle: TextStyle(color: Colors.black54),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColors.accentLight,
      ),
    );
  }
}
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/app_theme.dart';

class ThemeService extends ChangeNotifier {
  static const _prefsKey = 'app_theme_mode';

  AppThemeMode _mode = AppThemeMode.system;
  SharedPreferences? _prefs;

  AppThemeMode get mode => _mode;

  Future<void> init() async {
    try {
      _prefs = await SharedPreferences.getInstance();
      final stored = _prefs?.getString(_prefsKey);
      
      if (stored != null) {
        _mode = AppThemeModeExtension.fromString(stored);
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Ошибка чтения настроек темы: $e');
      // Оставляем дефолтное значение system
    }
  }

  Future<void> setMode(AppThemeMode newMode) async {
    if (_mode == newMode) return;

    _mode = newMode;
    notifyListeners();

    try {
      await _prefs?.setString(_prefsKey, newMode.toStorageValue());
    } catch (e) {
      debugPrint('Ошибка записи настроек темы: $e');
    }
  }
}
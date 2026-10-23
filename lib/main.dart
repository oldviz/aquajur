import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'database/app_database.dart';
import 'services/json_import_handler.dart';
import 'services/theme_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Настройка системного UI
  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.top],
  );

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  final db = AppDatabase();
  final navigatorKey = GlobalKey<NavigatorState>();
  
  ThemeService? themeService;

  try {
    themeService = ThemeService();
    await themeService.init();
  } catch (e) {
    debugPrint('Ошибка инициализации темы: $e');
    // Если тема не загрузилась, создадим сервис с дефолтным значением
    // чтобы приложение не упало.
    themeService = ThemeService(); 
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: themeService!),
        Provider<AppDatabase>.value(value: db),
      ],
      child: AquariumApp(
        db: db,
        navigatorKey: navigatorKey,
      ),
    ),
  );

  // Запускаем обработчик импорта отдельно
  JsonImportHandler(
    db: db,
    navigatorKey: navigatorKey,
  ).start();
}
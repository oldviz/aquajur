import 'package:flutter/foundation.dart';

/// Простой синглтон-сигнал, который позволяет любой части приложения
/// сказать UI: "Эй, данные изменились извне, перерисуйся!".
class UiRefreshSignal extends ChangeNotifier {
  static final UiRefreshSignal instance = UiRefreshSignal._internal();

  factory UiRefreshSignal() => instance;

  UiRefreshSignal._internal();

  /// Вызывается, когда нужно принудительно обновить основные списки.
  void triggerRefresh() {
    notifyListeners();
  }
}
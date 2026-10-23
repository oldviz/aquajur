// sync_provider.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class SyncProvider {
  String get name;
  bool get isConfigured;

  /// Отдаёт удалённый набор строк (в формате exportBundle) или null.
  Future<Map<String, dynamic>?> pull();

  /// Отправляет локальный набор строк на сервер.
  Future<void> push(Map<String, dynamic> bundle);
}

/// Заглушка: синхронизация не настроена, всё работает локально.
class DisabledSyncProvider implements SyncProvider {
  @override String get name => 'Отключена';
  @override bool get isConfigured => false;
  @override Future<Map<String, dynamic>?> pull() async => null;
  @override Future<void> push(Map<String, dynamic> bundle) async {}
}

/// Готовый каркас под будущий сервер. Достаточно поднять два эндпоинта:
///   GET  /sync/pull  -> json в формате exportBundle()
///   POST /sync/push  <- json в формате exportBundle()
class HttpSyncProvider implements SyncProvider {
  final String baseUrl;
  final String token;
  HttpSyncProvider(this.baseUrl, this.token);

  @override String get name => 'Сервер';
  @override bool get isConfigured => baseUrl.isNotEmpty;

  Map<String, String> get _h => {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

  @override
  Future<Map<String, dynamic>?> pull() async {
    final r = await http.get(Uri.parse('$baseUrl/sync/pull'), headers: _h);
    if (r.statusCode == 404) return null;
    if (r.statusCode != 200) throw Exception('pull: ${r.statusCode}');
    return jsonDecode(r.body) as Map<String, dynamic>;
  }

  @override
  Future<void> push(Map<String, dynamic> bundle) async {
    final r = await http.post(Uri.parse('$baseUrl/sync/push'),
        headers: _h, body: jsonEncode(bundle));
    if (r.statusCode >= 300) throw Exception('push: ${r.statusCode}');
  }
}
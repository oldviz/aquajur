import 'package:flutter/services.dart';

class PendingJsonFile {
  final String uri;
  final String? name;

  const PendingJsonFile({
    required this.uri,
    this.name,
  });
}

class JsonFileBridge {
  static const MethodChannel _channel = MethodChannel('app/json_file');

  /// Забирает ожидающий файл из Android.
  ///
  /// После вызова файл считается полученным и очищается в нативной части.
  static Future<PendingJsonFile?> takePendingFile() async {
    try {
      final result = await _channel.invokeMethod<Map<Object?, Object?>>(
        'getPendingFile',
      );

      if (result == null) {
        return null;
      }

      final uri = result['uri'];

      if (uri is! String || uri.isEmpty) {
        return null;
      }

      final name = result['name'];

      return PendingJsonFile(
        uri: uri,
        name: name is String ? name : null,
      );
    } on PlatformException {
      return null;
    } on MissingPluginException {
      return null;
    }
  }

  /// Читает текстовое содержимое файла по content/file URI.
  static Future<String?> readText(PendingJsonFile file) async {
    try {
      return await _channel.invokeMethod<String>(
        'readTextFromUri',
        {'uri': file.uri},
      );
    } on PlatformException {
      return null;
    } on MissingPluginException {
      return null;
    }
  }
}
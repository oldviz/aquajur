import 'dart:convert';

class ImportValidationResult {
  final bool isValid;
  final String? errorMessage;
  final Map<String, dynamic>? bundle;
  final Map<String, int>? rowCounts;

  const ImportValidationResult.invalid(this.errorMessage)
      : isValid = false,
        bundle = null,
        rowCounts = null;

  const ImportValidationResult.valid(this.bundle, this.rowCounts)
      : isValid = true,
        errorMessage = null;
}

ImportValidationResult validateImportJson(
  String source, {
  required List<String> expectedTables,
}) {
  if (source.trim().isEmpty) {
    return const ImportValidationResult.invalid('Файл пуст.');
  }

  dynamic decoded;

  try {
    decoded = jsonDecode(source);
  } on FormatException catch (e) {
    return ImportValidationResult.invalid(
      'Файл не является корректным JSON. ${e.message}',
    );
  }

  if (decoded is! Map) {
    return const ImportValidationResult.invalid(
      'Корень JSON должен быть объектом.',
    );
  }

  final map = Map<String, dynamic>.from(decoded);

  final format = map['format'];

  if (format != 1) {
    return ImportValidationResult.invalid(
      'Неизвестный формат резервной копии: ${format ?? 'отсутствует'}. '
      'Ожидался формат 1.',
    );
  }

  final rowCounts = <String, int>{};
  var hasKnownTable = false;

  for (final table in expectedTables) {
    if (!map.containsKey(table)) {
      continue;
    }

    hasKnownTable = true;

    final rows = map[table];

    if (rows is! List) {
      return ImportValidationResult.invalid(
        'Таблица "$table" должна быть списком.',
      );
    }

    var count = 0;

    for (var i = 0; i < rows.length; i++) {
      final row = rows[i];

      if (row is! Map) {
        return ImportValidationResult.invalid(
          'В таблице "$table" запись ${i + 1} не является объектом.',
        );
      }

      final id = row['id'];

      if (id is! String || id.trim().isEmpty) {
        return ImportValidationResult.invalid(
          'В таблице "$table" запись ${i + 1} не содержит корректный id.',
        );
      }

      count++;
    }

    rowCounts[table] = count;
  }

  if (!hasKnownTable) {
    return const ImportValidationResult.invalid(
      'В файле нет известных таблиц Aquarium Journal.',
    );
  }

  return ImportValidationResult.valid(map, rowCounts);
}
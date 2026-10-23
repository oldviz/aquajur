import 'package:flutter/material.dart';

class DefaultType {
  final String id;
  final String name;

  const DefaultType({
    required this.id,
    required this.name,
  });
}

abstract final class Catalog {
  static const defaultTestTypes = <DefaultType>[
    DefaultType(id: 'def_test_nh', name: 'NH: Аммиак / Аммоний'),
    DefaultType(id: 'def_test_no2', name: 'NO2: Нитриты'),
    DefaultType(id: 'def_test_no3', name: 'NO3: Нитраты'),
    DefaultType(id: 'def_test_po4', name: 'PO4: Фосфаты'),
    DefaultType(id: 'def_test_gh', name: 'GH: Общая жёсткость'),
    DefaultType(id: 'def_test_kh', name: 'KH: Карбонатная жёсткость'),
    DefaultType(id: 'def_test_ph', name: 'pH: Кислотность'),
    DefaultType(id: 'def_test_tds', name: 'TDS: Растворённые вещества'),
  ];

  static const defaultFertilizerTypes = <DefaultType>[
    DefaultType(id: 'def_fert_npk', name: 'NPK: Макро'),
    DefaultType(id: 'def_fert_micro', name: 'MICRO: Микроэлементы'),
    DefaultType(id: 'def_fert_fe', name: 'Fe: Железо'),
    DefaultType(id: 'def_fert_k', name: 'K: Калий'),
    DefaultType(id: 'def_fert_c', name: 'C: Углерод'),
  ];

  static const maintenanceTypes = <String>[
    'Подмена',
    'Сифонка грунта',
    'Обслуживание фильтра',
  ];

  static const hydrobiontTypes = <String>[
    'Рыбы',
    'Растения',
    'Ракообразные',
    'Моллюски',
  ];

  static const waterChangeType = 'Подмена';

  static bool isWaterChange(String type) => type == waterChangeType;

  static IconData maintenanceIcon(String type) {
    if (type.contains('Подмена')) return Icons.water_drop;

    if (type.contains('Сифонка') || type.contains('Грунт')) {
      return Icons.cleaning_services;
    }

    if (type.contains('Фильтр')) return Icons.filter_alt;

    return Icons.build;
  }

  /// Универсальное разделение метки вида:
  ///
  /// `КОД: Название`
  ///
  /// Для обратной совместимости также понимает:
  /// - `КОД - Название`
  /// - `КОД Название`
  static ({String code, String name}) splitTypeLabel(String raw) {
    final value = raw.trim();

    if (value.isEmpty) {
      return (code: '', name: '');
    }

    final colon = value.indexOf(':');

    if (colon >= 0) {
      final code = value.substring(0, colon).trim();
      final name = value.substring(colon + 1).trim();

      return (code: code, name: name);
    }

    final dash = value.indexOf(' - ');

    if (dash > 0) {
      return (
        code: value.substring(0, dash).trim(),
        name: value.substring(dash + 3).trim(),
      );
    }

    final space = value.indexOf(' ');

    if (space > 0) {
      return (
        code: value.substring(0, space).trim(),
        name: value.substring(space + 1).trim(),
      );
    }

    return (code: value, name: '');
  }
}
import 'package:flutter/material.dart';

import '../database/app_database.dart';

class AquariumHeader extends StatelessWidget {
  final Aquarium aquarium;
  final VoidCallback onBack;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onSettings;

  const AquariumHeader({
    super.key,
    required this.aquarium,
    required this.onBack,
    required this.onEdit,
    required this.onDelete,
    required this.onSettings,
  });

  @override
  Widget build(BuildContext context) {
    final launch = aquarium.launchDate;
    final ageText = _formatAge(launch);
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      // ИСПРАВЛЕНО: surface вместо жесткого цвета или appBarTheme.backgroundColor
      // Это даст единый фон с табами.
      color: colorScheme.surface,
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: onBack,
                icon: Icon(Icons.arrow_back, color: colorScheme.onSurface),
                tooltip: 'Назад',
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      aquarium.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${aquarium.volume} л • '
                      '${_fmtNum(aquarium.lengthCm)}×'
                      '${_fmtNum(aquarium.widthCm)}×'
                      '${_fmtNum(aquarium.heightCm)} см',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: onEdit,
                icon: Icon(Icons.edit, color: colorScheme.onSurface),
                tooltip: 'Редактировать',
              ),
              IconButton(
                onPressed: onDelete,
                icon: Icon(
                  Icons.delete_outline,
                  color: Colors.redAccent, // Удаление всегда красным
                ),
                tooltip: 'Удалить',
              ),
              IconButton(
                onPressed: onSettings,
                icon: Icon(Icons.settings, color: colorScheme.onSurface),
                tooltip: 'Настройки',
              ),
            ],
          ),

          const SizedBox(height: 6),

          if (launch != null)
            Row(
              children: [
                Text(
                  'Запущен: ${_formatDate(launch)}',
                  style: TextStyle(
                    fontSize: 12,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                if (ageText.isNotEmpty) ...[
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      ageText,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ],
            )
          else
            Text(
              'Дата запуска не указана',
              style: TextStyle(
                fontSize: 12,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
        ],
      ),
    );
  }

  String _fmtNum(double value) {
    if (value == value.roundToDouble()) {
      return value.toInt().toString();
    }
    return value.toStringAsFixed(1);
  }

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    return '$day.$month.${date.year}';
  }

  String _formatAge(DateTime? start) {
    if (start == null) return '';

    final now = DateTime.now();
    final launchDay = DateTime(start.year, start.month, start.day);
    final today = DateTime(now.year, now.month, now.day);

    if (launchDay.isAfter(today)) return 'запланирован';
    if (launchDay == today) return 'сегодня';

    final diff = _yearMonthDays(launchDay, now);
    final text = _formatYMD(diff.years, diff.months, diff.days);

    if (text.isEmpty) return 'сегодня';
    return '$text назад';
  }

  ({int years, int months, int days}) _yearMonthDays(
    DateTime from,
    DateTime to,
  ) {
    var years = to.year - from.year;
    var months = to.month - from.month;
    var days = to.day - from.day;

    if (days < 0) {
      months--;
      final daysInPreviousMonth = DateTime(to.year, to.month, 0).day;
      days += daysInPreviousMonth;
    }

    if (months < 0) {
      years--;
      months += 12;
    }

    return (years: years, months: months, days: days);
  }

  String _formatYMD(int years, int months, int days) {
    final parts = <String>[];

    if (years > 0) {
      parts.add('$years ${_plural(years, 'год', 'года', 'лет')}');
    }

    if (months > 0) {
      parts.add('$months ${_plural(months, 'месяц', 'месяца', 'месяцев')}');
    }

    if (days > 0 || parts.isEmpty) {
      parts.add('$days ${_plural(days, 'день', 'дня', 'дней')}');
    }

    return parts.join(' ');
  }

  String _plural(int value, String one, String few, String many) {
    final mod10 = value % 10;
    final mod100 = value % 100;

    if (mod10 == 1 && mod100 != 11) return one;
    if (mod10 >= 2 && mod10 <= 4 && (mod100 < 12 || mod100 > 14)) return few;
    return many;
  }
}
import 'dart:math';

final _rng = Random.secure();

/// UUID v4 без внешних зависимостей — первичный ключ для всех записей.
String newId() {
  final b = List<int>.generate(16, (_) => _rng.nextInt(256));
  b[6] = (b[6] & 0x0f) | 0x40;
  b[8] = (b[8] & 0x3f) | 0x80;
  final h = b.map((x) => x.toRadixString(16).padLeft(2, '0')).join();
  return '${h.substring(0, 8)}-${h.substring(8, 12)}-${h.substring(12, 16)}'
         '-${h.substring(16, 20)}-${h.substring(20)}';
}

int _min(String hhmm) {
  final p = hhmm.split(':');
  return (int.tryParse(p[0]) ?? 0) * 60 + (int.tryParse(p[1]) ?? 0);
}

/// Длительность свечения в часах, с корректным переходом через полночь.
double lightHours(String start, String end) {
  final d = (_min(end) - _min(start) + 1440) % 1440;
  return (d == 0 ? 1440 : d) / 60.0;
}

String fmtHours(double h) {
  final s = h.toStringAsFixed(1);
  return s.endsWith('.0') ? s.substring(0, s.length - 2) : s;
}

String fmtNum(double v) =>
    v == v.roundToDouble() ? v.toStringAsFixed(0) : v.toStringAsFixed(1);
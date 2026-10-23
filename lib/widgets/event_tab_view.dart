import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventTabView<T> extends StatefulWidget {
  final List<T> items;
  final DateTime Function(T item) getDate;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final String emptyMessage;
  final int pageSize;
  final bool showAll;
  final ValueChanged<bool> onShowAllChanged;

  const EventTabView({
    super.key,
    required this.items,
    required this.getDate,
    required this.itemBuilder,
    this.emptyMessage = 'Записей пока нет',
    this.pageSize = 20,
    required this.showAll,
    required this.onShowAllChanged,
  });

  @override
  State<EventTabView<T>> createState() => _EventTabViewState<T>();
}

class _EventTabViewState<T> extends State<EventTabView<T>> {
  DateTime? _selectedDate;
  int _pageIndex = 0;

  bool _sameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  @override
  void didUpdateWidget(EventTabView<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.showAll != widget.showAll) {
      _pageIndex = 0;
    }
  }

  List<T> get _sorted {
    final list = List<T>.from(widget.items);
    list.sort((a, b) => widget.getDate(b).compareTo(widget.getDate(a)));
    return list;
  }

  List<DateTime> get _availableDates {
    final set = <DateTime>{};
    for (final item in widget.items) {
      final d = widget.getDate(item);
      set.add(DateTime(d.year, d.month, d.day));
    }
    final list = set.toList()..sort((a, b) => b.compareTo(a));
    return list;
  }

  void _goOlder() {
    setState(() {
      if (widget.showAll) {
        _pageIndex++;
      } else {
        final dates = _availableDates;
        final idx = dates.indexWhere((d) => _sameDay(d, _selectedDate!));
        if (idx >= 0 && idx < dates.length - 1) {
          _selectedDate = dates[idx + 1];
        }
      }
    });
  }

  void _goNewer() {
    setState(() {
      if (widget.showAll) {
        if (_pageIndex > 0) _pageIndex--;
      } else {
        final dates = _availableDates;
        final idx = dates.indexWhere((d) => _sameDay(d, _selectedDate!));
        if (idx > 0) {
          _selectedDate = dates[idx - 1];
        }
      }
    });
  }

  bool get _canGoOlder {
    if (widget.showAll) {
      return (_pageIndex + 1) * widget.pageSize < _sorted.length;
    } else {
      if (_selectedDate == null) return false;
      final dates = _availableDates;
      final idx = dates.indexWhere((d) => _sameDay(d, _selectedDate!));
      return idx >= 0 && idx < dates.length - 1;
    }
  }

  bool get _canGoNewer {
    if (widget.showAll) {
      return _pageIndex > 0;
    } else {
      if (_selectedDate == null) return false;
      final dates = _availableDates;
      final idx = dates.indexWhere((d) => _sameDay(d, _selectedDate!));
      return idx > 0;
    }
  }

  String get _headerTitle {
    if (widget.showAll) {
      final total = _sorted.length;
      if (total == 0) return 'Нет записей';
      final start = _pageIndex * widget.pageSize;
      final end = (start + widget.pageSize).clamp(0, total);
      return 'Записи ${start + 1}–$end из $total';
    } else {
      if (_selectedDate == null) return '';
      return DateFormat('dd.MM.yyyy').format(_selectedDate!);
    }
  }

  Future<void> _pickDate(BuildContext context) async {
    final dates = _availableDates;
    if (dates.isEmpty) return;

    final currentHour = _selectedDate?.hour ?? 12;
    final currentMinute = _selectedDate?.minute ?? 0;

    final firstDate = dates.last;
    final lastDate = dates.first;

    final picked = await showDialog<DateTime>(
      context: context,
      builder: (ctx) => AlertDialog(
        contentPadding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
        content: SizedBox(
          width: 320,
          height: 340,
          child: CalendarDatePicker(
            initialDate: _selectedDate ?? lastDate,
            firstDate: firstDate,
            lastDate: lastDate,
            selectableDayPredicate: (day) => dates.any((d) => _sameDay(d, day)),
            onDateChanged: (date) => Navigator.of(ctx).pop(date),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Отмена'),
          ),
        ],
      ),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = DateTime(
          picked.year, picked.month, picked.day,
          currentHour, currentMinute,
        );
      });
    }
  }

  Widget _buildDaySeparator(DateTime day) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
        child: Center(
          child: Text(
            DateFormat('dd.MM.yyyy').format(day),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) {
      return Center(
        child: Text(widget.emptyMessage, style: const TextStyle(color: Colors.white38)),
      );
    }

    final sorted = _sorted;
    final dates = _availableDates;

    if (_selectedDate == null || !dates.any((d) => _sameDay(d, _selectedDate!))) {
      _selectedDate = dates.isNotEmpty ? dates.first : null;
    }

    List<T> visible;
    if (widget.showAll) {
      if (_pageIndex * widget.pageSize >= sorted.length && _pageIndex > 0) {
        _pageIndex = 0;
      }
      final s = _pageIndex * widget.pageSize;
      final e = (s + widget.pageSize).clamp(0, sorted.length);
      visible = sorted.sublist(s, e);
    } else {
      visible = sorted
          .where((item) => _sameDay(widget.getDate(item), _selectedDate!))
          .toList();
    }

    Widget listContent;
    if (widget.showAll) {
      final children = <Widget>[];
      DateTime? lastDay;
      for (final item in visible) {
        final d = widget.getDate(item);
        final day = DateTime(d.year, d.month, d.day);
        if (lastDay == null || !_sameDay(day, lastDay)) {
          children.add(_buildDaySeparator(day));
          lastDay = day;
        } else {
          children.add(const _DottedDivider());
        }
        children.add(widget.itemBuilder(context, item));
      }
      listContent = ListView(
        padding: const EdgeInsets.only(top: 8, bottom: 90),
        children: children,
      );
    } else {
      listContent = ListView.separated(
        padding: const EdgeInsets.only(top: 8, bottom: 90),
        itemCount: visible.length,
        separatorBuilder: (_, __) => const _DottedDivider(),
        itemBuilder: (ctx, i) => widget.itemBuilder(ctx, visible[i]),
      );
    }

    Widget headerTitle;
    if (widget.showAll) {
      headerTitle = Text(
        _headerTitle,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
      );
    } else {
      headerTitle = InkWell(
        onTap: dates.isEmpty ? null : () => _pickDate(context),
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _headerTitle,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  color: Color(0xFF4DD0E1),
                  decoration: TextDecoration.underline,
                  decorationColor: Color(0xFF4DD0E1),
                ),
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.calendar_today,
                size: 14,
                color: Color(0xFF4DD0E1),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: _canGoOlder ? _goOlder : null,
                tooltip: 'Назад',
              ),
              Expanded(child: headerTitle),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: _canGoNewer ? _goNewer : null,
                tooltip: 'Вперёд',
              ),
              const SizedBox(width: 4),
              SizedBox(
                width: 135,
                child: Row(
                  children: [
                    const Expanded(
                      child: Text('Показать всё',
                          style: TextStyle(fontSize: 11, color: Colors.white54)),
                    ),
                    Switch(
                      value: widget.showAll,
                      onChanged: widget.onShowAllChanged,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const _DottedDivider(),
        Expanded(
          child: visible.isEmpty
              ? const Center(
                  child: Text('Нет записей', style: TextStyle(color: Colors.white38)))
              : listContent,
        ),
      ],
    );
  }
}

class _DottedDivider extends StatelessWidget {
  const _DottedDivider();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 9,
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            const dotSize = 2.0;
            const gap = 7.0;
            final count = constraints.maxWidth ~/ (dotSize + gap);
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                count,
                (_) => Container(
                  width: dotSize,
                  height: dotSize,
                  decoration: const BoxDecoration(
                    color: Color(0x1FFFFFFF),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
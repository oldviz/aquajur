import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeField extends StatelessWidget {
  final String label;
  final DateTime value;
  final ValueChanged<DateTime> onChanged;

  const DateTimeField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  Future<void> _pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDatePickerMode: DatePickerMode.day,
    );
    if (picked != null) {
      // Меняем только дату, время сохраняем (нужно для сортировки внутри дня)
      onChanged(DateTime(
        picked.year, picked.month, picked.day,
        value.hour, value.minute, value.second,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _pickDate(context),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          suffixIcon: const Icon(Icons.calendar_today),
        ),
        child: Text(
          DateFormat('dd.MM.yyyy').format(value),
          style: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
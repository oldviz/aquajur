import 'package:flutter/material.dart';

String fmtDate(DateTime d) {
  String p(int n) => n.toString().padLeft(2, '0');
  return '${p(d.day)}.${p(d.month)}.${d.year} ${p(d.hour)}:${p(d.minute)}';
}

PopupMenuButton<String> buildEditDeleteMenu(
  BuildContext ctx, VoidCallback onEdit, VoidCallback onDelete,
) => PopupMenuButton<String>(
  onSelected: (v) {
    if (v == 'e') onEdit();
    if (v == 'd') onDelete();
  },
  itemBuilder: (_) => const [
    PopupMenuItem(value: 'e', child: Text('Изменить')),
    PopupMenuItem(value: 'd', child: Text('Удалить')),
  ],
);
import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import 'list_helpers.dart';

class EventCodeLabel extends StatelessWidget {
  final String text;

  const EventCodeLabel({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56,
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: AppColors.accent,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }
}

class CompactEventTile extends StatelessWidget {
  final Widget? leading;
  final String title;
  final String? value;
  final TextStyle? valueStyle;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const CompactEventTile({
    super.key,
    this.leading,
    required this.title,
    this.value,
    this.valueStyle,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      visualDensity: const VisualDensity(vertical: -4),
      leading: leading,
      title: Row(
        children: [
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (value != null && value!.isNotEmpty) ...[
            const SizedBox(width: 8),
            Text(
              value!,
              maxLines: 2,
              textAlign: TextAlign.right,
              style: valueStyle ?? const TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ],
      ),
      trailing: buildEditDeleteMenu(context, onEdit, onDelete),
    );
  }
}
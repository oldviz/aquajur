import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../core/catalog.dart';

/// Элемент выпадающего списка с выровненными колонками:
///
/// `КОД   Название`
class TypeDropdownItem extends StatelessWidget {
  final String label;
  final double codeWidth;

  const TypeDropdownItem({
    super.key,
    required this.label,
    this.codeWidth = 78,
  });

  @override
  Widget build(BuildContext context) {
    final parts = Catalog.splitTypeLabel(label);

    if (parts.code.isEmpty && parts.name.isEmpty) {
      return const SizedBox.shrink();
    }

    if (parts.name.isEmpty) {
      return Text(
        parts.code,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    }

    if (parts.code.isEmpty) {
      return Text(
        parts.name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    }

    return Row(
      children: [
        SizedBox(
          width: codeWidth,
          child: Text(
            parts.code,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.accent,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          child: Text(
            parts.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
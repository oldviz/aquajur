import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'type_label.dart';

class WizardTypeOption {
  final String id;
  final String label;
  final Widget? leading;
  final bool plainText;

  const WizardTypeOption({
    required this.id,
    required this.label,
    this.leading,
    this.plainText = false,
  });
}

class WizardTypeStep extends StatelessWidget {
  final String title;
  final bool loading;
  final List<WizardTypeOption> options;
  final String emptyMessage;
  final bool allowCreateNew;
  final VoidCallback? onCreateNew;
  final ValueChanged<WizardTypeOption> onSelect;
  final VoidCallback? onClose;

  const WizardTypeStep({
    super.key,
    required this.title,
    required this.options,
    required this.onSelect,
    this.loading = false,
    this.emptyMessage = 'Список пуст',
    this.allowCreateNew = false,
    this.onCreateNew,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final closeAction = onClose ?? () => Navigator.of(context).pop();
    final colorScheme = Theme.of(context).colorScheme;

    final header = Padding(
      padding: const EdgeInsets.only(left: 8, right: 4, bottom: 12),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
            ),
          ),
          IconButton(
            onPressed: closeAction,
            tooltip: 'Закрыть',
            icon: Icon(
              Icons.close,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );

    if (loading) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header,
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 32),
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      );
    }

    final itemCount = options.length + (allowCreateNew ? 1 : 0);

    if (itemCount == 0) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Center(
              child: Text(
                emptyMessage,
                style: TextStyle(color: colorScheme.onSurfaceVariant),
              ),
            ),
          ),
        ],
      );
    }

    final maxListHeight = math.min(
      360.0,
      MediaQuery.of(context).size.height * 0.45,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        header,
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: maxListHeight,
          ),
          child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const ClampingScrollPhysics(),
            itemCount: itemCount,
            separatorBuilder: (_, __) => Divider(
              height: 1,
              thickness: 1,
              color: colorScheme.outlineVariant,
            ),
            itemBuilder: (context, index) {
              if (index < options.length) {
                final option = options[index];

                return ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 8),
                  visualDensity: const VisualDensity(vertical: -4),
                  leading: option.leading,
                  title: _buildTitle(option, colorScheme),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  onTap: () => onSelect(option),
                );
              }

              return ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8),
                visualDensity: const VisualDensity(vertical: -4),
                title: Text(
                  '＋ Новый тип…',
                  style: TextStyle(color: colorScheme.primary),
                ),
                trailing: Icon(
                  Icons.add,
                  color: colorScheme.primary,
                ),
                onTap: onCreateNew,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTitle(WizardTypeOption option, ColorScheme colorScheme) {
    if (option.plainText || option.leading != null) {
      return Text(
        option.label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 15,
        ),
      );
    }

    return TypeDropdownItem(label: option.label);
  }
}
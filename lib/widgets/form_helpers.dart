import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'date_time_field.dart';

/// Форматтер, который всегда делает первый ненулевой символ строки заглавным.
class UpperCaseFirstLetterFormatter extends TextInputFormatter {
  const UpperCaseFirstLetterFormatter();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;

    if (text.isEmpty) {
      return newValue;
    }

    final match = RegExp(r'\S').firstMatch(text);

    if (match == null) {
      return newValue;
    }

    final index = match.start;
    final char = text[index];
    final upper = char.toUpperCase();

    if (char == upper) {
      return newValue;
    }

    final updated = text.replaceRange(index, index + 1, upper);

    return TextEditingValue(
      text: updated,
      selection: newValue.selection,
      composing: TextRange.empty,
    );
  }
}

double? parseDouble(String value) {
  final normalized = value.replaceAll(',', '.').trim();
  return double.tryParse(normalized);
}

void requestFocusLater(
  BuildContext context,
  FocusNode node, {
  Duration delay = const Duration(milliseconds: 30),
}) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    Future.delayed(delay, () {
      if (context.mounted) {
        node.requestFocus();
      }
    });
  });
}

Future<String?> showNewNameDialog(
  BuildContext context, {
  required String title,
  String hint = 'Название',
}) async {
  final controller = TextEditingController();

  final result = await showDialog<String>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(title),
      content: TextField(
        controller: controller,
        autofocus: true,
        textCapitalization: TextCapitalization.sentences,
        inputFormatters: const [
          UpperCaseFirstLetterFormatter(),
        ],
        decoration: InputDecoration(labelText: hint),
        onSubmitted: (value) => Navigator.pop(ctx, value),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx),
          child: const Text('Отмена'),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(ctx, controller.text),
          child: const Text('Добавить'),
        ),
      ],
    ),
  );

  controller.dispose();

  final trimmed = result?.trim();

  if (trimmed == null || trimmed.isEmpty) {
    return null;
  }

  return trimmed;
}

class FormBody extends StatelessWidget {
  final List<Widget> children;

  const FormBody({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final spaced = <Widget>[];

    for (var i = 0; i < children.length; i++) {
      if (i > 0) {
        spaced.add(const SizedBox(height: 12));
      }

      spaced.add(children[i]);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: spaced,
    );
  }
}

class LabeledTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String label;
  final String? helperText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? minLines;
  final bool capitalize;
  final List<TextInputFormatter>? inputFormatters;

  const LabeledTextField({
    super.key,
    required this.controller,
    required this.label,
    this.focusNode,
    this.helperText,
    this.keyboardType,
    this.maxLines,
    this.minLines,
    this.capitalize = true,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    final formatters = <TextInputFormatter>[
      if (capitalize) const UpperCaseFirstLetterFormatter(),
      ...?inputFormatters,
    ];

    return TextField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      maxLines: maxLines,
      minLines: minLines,
      textCapitalization:
          capitalize ? TextCapitalization.sentences : TextCapitalization.none,
      inputFormatters: formatters.isEmpty ? null : formatters,
      enableSuggestions: capitalize,
      smartDashesType:
          capitalize ? SmartDashesType.enabled : SmartDashesType.disabled,
      smartQuotesType:
          capitalize ? SmartQuotesType.enabled : SmartQuotesType.disabled,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        labelText: label,
        helperText: helperText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}

class NumberFormField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String label;
  final String? helperText;
  final bool decimal;

  const NumberFormField({
    super.key,
    required this.controller,
    required this.label,
    this.focusNode,
    this.helperText,
    this.decimal = true,
  });

  @override
  Widget build(BuildContext context) {
    return LabeledTextField(
      controller: controller,
      focusNode: focusNode,
      label: label,
      helperText: helperText,
      keyboardType: decimal
          ? TextInputType.numberWithOptions(decimal: true)
          : TextInputType.number,
      inputFormatters: [
        if (decimal)
          FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]'))
        else
          FilteringTextInputFormatter.digitsOnly,
      ],
      capitalize: false,
    );
  }
}

class FormDropdownField<T> extends StatelessWidget {
  final T? value;
  final String label;
  final String? hintText;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?>? onChanged;

  const FormDropdownField({
    super.key,
    required this.value,
    required this.label,
    required this.items,
    this.hintText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
      items: items,
      onChanged: onChanged,
    );
  }
}

class FormDateTimeField extends StatelessWidget {
  final String label;
  final DateTime value;
  final ValueChanged<DateTime> onChanged;

  const FormDateTimeField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      label: label,
      value: value,
      onChanged: onChanged,
    );
  }
}

class FormSubmitButton extends StatelessWidget {
  final Future<void> Function()? onPressed;
  final String label;

  const FormSubmitButton({
    super.key,
    required this.onPressed,
    this.label = 'Сохранить',
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed == null
          ? null
          : () {
              onPressed!();
            },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(label),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../../../database/app_database.dart';
import '../../../database/tables.dart';
import '../../../widgets/form_helpers.dart';
import '../../../widgets/wizard_form_sheet.dart';

class NoteForm extends StatefulWidget {
  final AppDatabase db;
  final String aquariumId;
  final Note? existing;
  final WizardFormController wizard;

  const NoteForm({
    super.key,
    required this.db,
    required this.aquariumId,
    required this.wizard,
    this.existing,
  });

  @override
  State<NoteForm> createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  late final TextEditingController _text =
      TextEditingController(text: widget.existing?.content ?? '');

  final FocusNode _textFocus = FocusNode();

  late DateTime _date;

  @override
  void initState() {
    super.initState();

    _date = widget.existing?.noteDate ?? DateTime.now();

    // Для заметок клавиатура ожидается сразу.
    widget.wizard.expectKeyboard(true);
    requestFocusLater(context, _textFocus);
  }

  @override
  void dispose() {
    _text.dispose();
    _textFocus.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (_text.text.trim().isEmpty) return;

    await widget.db.saveNote(
      widget.aquariumId,
      widget.existing?.id,
      _text.text.trim(),
      _date,
    );

    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      child: FormBody(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Заметка',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
              IconButton(
                onPressed: _save,
                tooltip: 'Сохранить',
                icon: Icon(
                  Icons.save,
                  color: colorScheme.primary,
                ),
              ),
            ],
          ),
          LabeledTextField(
            controller: _text,
            focusNode: _textFocus,
            label: 'Текст',
            maxLines: 5,
            minLines: 3,
          ),
          FormDateTimeField(
            label: 'Дата',
            value: _date,
            onChanged: (d) => setState(() => _date = d),
          ),
        ],
      ),
    );
  }
}
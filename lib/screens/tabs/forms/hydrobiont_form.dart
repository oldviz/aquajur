import 'package:flutter/material.dart';

import '../../../core/catalog.dart';
import '../../../database/app_database.dart';
import '../../../database/tables.dart';
import '../../../widgets/form_helpers.dart';
import '../../../widgets/hydrobiont_icons/hydrobiont_glyph.dart';
import '../../../widgets/type_picker.dart';
import '../../../widgets/wizard_form_sheet.dart';

class HydrobiontForm extends StatefulWidget {
  final AppDatabase db;
  final String aquariumId;
  final Hydrobiont? existing;
  final WizardFormController wizard;

  const HydrobiontForm({
    super.key,
    required this.db,
    required this.aquariumId,
    required this.wizard,
    this.existing,
  });

  @override
  State<HydrobiontForm> createState() => _HydrobiontFormState();
}

enum _HydrobiontStep {
  type,
  details,
}

class _HydrobiontFormState extends State<HydrobiontForm> {
  late _HydrobiontStep _step;
  late String _hType;
  late String _action;

  late final TextEditingController _species = TextEditingController(
    text: widget.existing?.species ?? '',
  );

  late final TextEditingController _qty = TextEditingController(
    text: widget.existing?.quantity.toString() ?? '1',
  );

  final FocusNode _speciesFocus = FocusNode();

  late DateTime _date;

  @override
  void initState() {
    super.initState();

    _date = widget.existing?.actionDate ?? DateTime.now();
    _action = widget.existing?.action ?? 'added';
    _hType = widget.existing?.hydrobiontType ?? '';

    _step = widget.existing == null
        ? _HydrobiontStep.type
        : _HydrobiontStep.details;

    if (_step == _HydrobiontStep.details) {
      if (_hType.isEmpty) {
        _step = _HydrobiontStep.type;
        widget.wizard.expectKeyboard(false);
      } else {
        _enterDetails();
      }
    } else {
      widget.wizard.expectKeyboard(false);
    }
  }

  @override
  void dispose() {
    _species.dispose();
    _qty.dispose();
    _speciesFocus.dispose();
    super.dispose();
  }

  void _enterDetails() {
    widget.wizard.expectKeyboard(true);
    requestFocusLater(context, _speciesFocus);
  }

  void _goToTypeStep() {
    widget.wizard.expectKeyboard(false);
    FocusManager.instance.primaryFocus?.unfocus();

    setState(() {
      _step = _HydrobiontStep.type;
    });
  }

  void _selectType(String type) {
    setState(() {
      _hType = type;
      _step = _HydrobiontStep.details;
    });

    _enterDetails();
  }

  Future<void> _save() async {
    final quantity = int.tryParse(_qty.text.trim()) ?? 0;
    final species = _species.text.trim();

    if (species.isEmpty || quantity == 0) return;

    await widget.db.saveHydrobiont(
      widget.aquariumId,
      widget.existing?.id,
      species,
      quantity,
      _action,
      _hType,
      _date,
    );

    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    if (_step == _HydrobiontStep.type) {
      final colorScheme = Theme.of(context).colorScheme;

      return WizardTypeStep(
        title: 'Выберите тип обитателя',
        options: [
          for (final type in Catalog.hydrobiontTypes)
            WizardTypeOption(
              id: type,
              label: type,
              leading: HydrobiontGlyph(
                type: type,
                color: colorScheme.primary,
                size: 24,
              ),
              plainText: true,
            ),
        ],
        onSelect: (option) => _selectType(option.id),
      );
    }

    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      child: FormBody(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  _hType,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
              ),
              IconButton(
                onPressed: _goToTypeStep,
                tooltip: 'Изменить тип',
                icon: Icon(
                  Icons.edit,
                  color: colorScheme.primary,
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
            controller: _species,
            focusNode: _speciesFocus,
            label: 'Название',
          ),
          NumberFormField(
            controller: _qty,
            label: 'Количество',
            decimal: false,
          ),
          SegmentedButton<String>(
            segments: const [
              ButtonSegment(value: 'added', label: Text('Посажено')),
              ButtonSegment(value: 'removed', label: Text('Убрано')),
            ],
            selected: {_action},
            onSelectionChanged: (s) => setState(() => _action = s.first),
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
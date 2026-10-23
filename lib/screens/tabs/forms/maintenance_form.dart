import 'package:flutter/material.dart';

import '../../../core/catalog.dart';
import '../../../database/app_database.dart';
import '../../../database/tables.dart';
import '../../../widgets/form_helpers.dart';
import '../../../widgets/type_picker.dart';
import '../../../widgets/wizard_form_sheet.dart';

class MaintenanceForm extends StatefulWidget {
  final AppDatabase db;
  final String aquariumId;
  final MaintenanceRecord? existing;
  final WizardFormController wizard;

  const MaintenanceForm({
    super.key,
    required this.db,
    required this.aquariumId,
    required this.wizard,
    this.existing,
  });

  @override
  State<MaintenanceForm> createState() => _MaintenanceFormState();
}

enum _MaintenanceStep {
  type,
  details,
}

class _MaintenanceFormState extends State<MaintenanceForm> {
  late _MaintenanceStep _step;
  late String _type;

  late final TextEditingController _amount = TextEditingController(
    text: _numberToText(widget.existing?.volumeOrAmount),
  );

  final FocusNode _amountFocus = FocusNode();

  late DateTime _date;

  @override
  void initState() {
    super.initState();

    _date = widget.existing?.actionDate ?? DateTime.now();
    _type = widget.existing?.maintenanceType ?? '';

    _step = widget.existing == null
        ? _MaintenanceStep.type
        : _MaintenanceStep.details;

    if (_step == _MaintenanceStep.details) {
      if (_type.isEmpty) {
        _step = _MaintenanceStep.type;
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
    _amount.dispose();
    _amountFocus.dispose();
    super.dispose();
  }

  bool get _showAmountField => Catalog.isWaterChange(_type);

  void _enterDetails() {
    final needsKeyboard = _showAmountField;

    widget.wizard.expectKeyboard(needsKeyboard);

    if (needsKeyboard) {
      requestFocusLater(context, _amountFocus);
    }
  }

  void _goToTypeStep() {
    widget.wizard.expectKeyboard(false);
    FocusManager.instance.primaryFocus?.unfocus();

    setState(() {
      _step = _MaintenanceStep.type;
    });
  }

  void _selectType(String type) {
    setState(() {
      _type = type;
      _step = _MaintenanceStep.details;
    });

    _enterDetails();
  }

  Future<void> _addCustomType() async {
    final name = await showNewNameDialog(
      context,
      title: 'Новый тип обслуживания',
      hint: 'Название',
    );

    if (name == null) return;

    _selectType(name);
  }

  String _numberToText(double? value) {
    if (value == null || value == 0) return '';

    if (value == value.roundToDouble()) {
      return value.toInt().toString();
    }

    return value.toString();
  }

  Future<void> _save() async {
    double amount = 0;

    if (_showAmountField) {
      amount = parseDouble(_amount.text) ?? 0;

      if (amount <= 0) return;
    }

    await widget.db.saveMaintenance(
      widget.aquariumId,
      widget.existing?.id,
      _type,
      amount,
      _date,
    );

    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    if (_step == _MaintenanceStep.type) {
      final colorScheme = Theme.of(context).colorScheme;

      return WizardTypeStep(
        title: 'Выберите тип обслуживания',
        options: [
          for (final type in Catalog.maintenanceTypes)
            WizardTypeOption(
              id: type,
              label: type,
              leading: Icon(
                Catalog.maintenanceIcon(type),
                color: colorScheme.primary,
              ),
              plainText: true,
            ),
        ],
        allowCreateNew: true,
        onCreateNew: _addCustomType,
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
                  _type,
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
          if (_showAmountField)
            NumberFormField(
              controller: _amount,
              focusNode: _amountFocus,
              label: 'Объём подмены (л)',
            )
          else
            Text(
              'Дополнительные числовые поля для этого типа не требуются.',
              style: TextStyle(color: colorScheme.onSurfaceVariant),
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
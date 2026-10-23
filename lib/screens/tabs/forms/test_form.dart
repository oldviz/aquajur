import 'package:flutter/material.dart';

import '../../../database/app_database.dart';
import '../../../database/tables.dart';
import '../../../widgets/form_helpers.dart';
import '../../../widgets/type_label.dart';
import '../../../widgets/type_picker.dart';
import '../../../widgets/wizard_form_sheet.dart';

class TestForm extends StatefulWidget {
  final AppDatabase db;
  final String aquariumId;
  final WaterTest? existing;
  final String? presetTypeId;
  final WizardFormController wizard;

  const TestForm({
    super.key,
    required this.db,
    required this.aquariumId,
    required this.wizard,
    this.existing,
    this.presetTypeId,
  });

  @override
  State<TestForm> createState() => _TestFormState();
}

enum _TestStep {
  type,
  details,
}

class _TestFormState extends State<TestForm> {
  late _TestStep _step;

  late String? _typeId;
  String? _typeName;

  late final TextEditingController _value = TextEditingController(
    text: widget.existing?.value ?? '',
  );

  final FocusNode _valueFocus = FocusNode();

  late DateTime _date;

  @override
  void initState() {
    super.initState();

    _date = widget.existing?.testDate ?? DateTime.now();
    _typeId = widget.existing?.testTypeId ?? widget.presetTypeId;

    final isCreateWithoutPreset =
        widget.existing == null && widget.presetTypeId == null;

    _step = isCreateWithoutPreset ? _TestStep.type : _TestStep.details;

    if (_step == _TestStep.details) {
      if (_typeId == null) {
        _step = _TestStep.type;
        widget.wizard.expectKeyboard(false);
      } else {
        _enterDetails();
        _resolveTypeName();
      }
    } else {
      widget.wizard.expectKeyboard(false);
    }
  }

  @override
  void dispose() {
    _value.dispose();
    _valueFocus.dispose();
    super.dispose();
  }

  void _enterDetails() {
    widget.wizard.expectKeyboard(true);
    requestFocusLater(context, _valueFocus);
  }

  void _goToTypeStep() {
    widget.wizard.expectKeyboard(false);
    FocusManager.instance.primaryFocus?.unfocus();

    setState(() {
      _step = _TestStep.type;
    });
  }

  void _selectType(String id, String name) {
    setState(() {
      _typeId = id;
      _typeName = name;
      _step = _TestStep.details;
    });

    _enterDetails();
  }

  Future<void> _resolveTypeName() async {
    final typeId = _typeId;

    if (typeId == null) {
      _goToTypeStep();
      return;
    }

    final types = await widget.db.watchTestTypes().first;

    String? name;

    for (final type in types) {
      if (type.id == typeId) {
        name = type.name;
        break;
      }
    }

    if (!mounted) return;

    if (name == null) {
      _goToTypeStep();
      return;
    }

    setState(() {
      _typeName = name;
    });
  }

  Future<void> _addType() async {
    final name = await showNewNameDialog(
      context,
      title: 'Новый тип теста',
      hint: 'Формат: NH: Аммиак / Аммоний',
    );

    if (name == null) return;

    final id = await widget.db.addTestType(name);

    if (id.isEmpty) return;

    _selectType(id, name);
  }

  Future<void> _save() async {
    final typeId = _typeId;
    final value = _value.text.trim();

    if (typeId == null || value.isEmpty) return;

    await widget.db.saveTest(
      widget.aquariumId,
      widget.existing?.id,
      typeId,
      value,
      _date,
    );

    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    if (_step == _TestStep.type) {
      return StreamBuilder<List<TestType>>(
        stream: widget.db.watchTestTypes(),
        builder: (_, snapshot) {
          final types = snapshot.data ?? [];

          final isLoading =
              snapshot.connectionState == ConnectionState.waiting &&
                  types.isEmpty;

          return WizardTypeStep(
            title: 'Выберите тип теста',
            loading: isLoading,
            emptyMessage: 'Типов тестов пока нет',
            allowCreateNew: true,
            onCreateNew: _addType,
            options: [
              for (final type in types)
                WizardTypeOption(
                  id: type.id,
                  label: type.name,
                ),
            ],
            onSelect: (option) => _selectType(option.id, option.label),
          );
        },
      );
    }

    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      child: FormBody(
        children: [
          Row(
            children: [
              Expanded(
                child: TypeDropdownItem(
                  label: _typeName ?? 'Загрузка…',
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
          NumberFormField(
            controller: _value,
            focusNode: _valueFocus,
            label: 'Результат',
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
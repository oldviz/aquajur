import 'package:flutter/material.dart';

import '../../../database/app_database.dart';
import '../../../database/tables.dart';
import '../../../widgets/form_helpers.dart';
import '../../../widgets/type_label.dart';
import '../../../widgets/type_picker.dart';
import '../../../widgets/wizard_form_sheet.dart';

class FertilizerForm extends StatefulWidget {
  final AppDatabase db;
  final String aquariumId;
  final int aquariumVolume;
  final FertilizerApplication? existing;
  final WizardFormController wizard;

  const FertilizerForm({
    super.key,
    required this.db,
    required this.aquariumId,
    required this.aquariumVolume,
    required this.wizard,
    this.existing,
  });

  @override
  State<FertilizerForm> createState() => _FertilizerFormState();
}

enum _FertilizerStep {
  type,
  details,
}

class _FertilizerFormState extends State<FertilizerForm> {
  late _FertilizerStep _step;

  late String? _typeId;
  String? _typeName;

  late final TextEditingController _dosage = TextEditingController(
    text: widget.existing == null ? '' : widget.existing!.dosage.toString(),
  );

  late final TextEditingController _total = TextEditingController(
    text: widget.existing == null
        ? ''
        : widget.existing!.totalAmount.toString(),
  );

  final FocusNode _dosageFocus = FocusNode();
  final FocusNode _totalFocus = FocusNode();

  late DateTime _date;

  bool _isUpdating = false;

  @override
  void initState() {
    super.initState();

    _date = widget.existing?.actionDate ?? DateTime.now();
    _typeId = widget.existing?.fertilizerTypeId;

    _step = widget.existing == null
        ? _FertilizerStep.type
        : _FertilizerStep.details;

    _dosage.addListener(_onDosageChanged);
    _total.addListener(_onTotalChanged);

    if (_step == _FertilizerStep.details) {
      if (_typeId == null) {
        _step = _FertilizerStep.type;
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
    _dosage.removeListener(_onDosageChanged);
    _total.removeListener(_onTotalChanged);

    _dosage.dispose();
    _total.dispose();

    _dosageFocus.dispose();
    _totalFocus.dispose();

    super.dispose();
  }

  void _enterDetails() {
    widget.wizard.expectKeyboard(true);
    requestFocusLater(context, _dosageFocus);
  }

  void _goToTypeStep() {
    widget.wizard.expectKeyboard(false);
    FocusManager.instance.primaryFocus?.unfocus();

    setState(() {
      _step = _FertilizerStep.type;
    });
  }

  void _selectType(String id, String name) {
    setState(() {
      _typeId = id;
      _typeName = name;
      _step = _FertilizerStep.details;
    });

    _enterDetails();
  }

  Future<void> _resolveTypeName() async {
    final typeId = _typeId;

    if (typeId == null) {
      _goToTypeStep();
      return;
    }

    final types = await widget.db.watchFertilizerTypes().first;

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
      title: 'Новое удобрение',
      hint: 'Формат: Fe: Железо',
    );

    if (name == null) return;

    final id = await widget.db.addFertilizerType(name);

    if (id.isEmpty) return;

    _selectType(id, name);
  }

  void _onDosageChanged() {
    if (_isUpdating) return;
    _isUpdating = true;

    final dosage = parseDouble(_dosage.text);

    if (dosage != null && dosage > 0) {
      final total = dosage * widget.aquariumVolume;
      _total.text = total.toStringAsFixed(2);
    } else {
      _total.text = '';
    }

    _isUpdating = false;
  }

  void _onTotalChanged() {
    if (_isUpdating) return;
    _isUpdating = true;

    final total = parseDouble(_total.text);

    if (total != null && total > 0 && widget.aquariumVolume > 0) {
      final dosage = total / widget.aquariumVolume;
      _dosage.text = dosage.toStringAsFixed(4);
    } else {
      _dosage.text = '';
    }

    _isUpdating = false;
  }

  Future<void> _save() async {
    final typeId = _typeId;
    final dosage = parseDouble(_dosage.text);
    final total = parseDouble(_total.text);

    if (typeId == null || dosage == null || total == null) return;

    await widget.db.saveFertilizer(
      widget.aquariumId,
      widget.existing?.id,
      typeId,
      dosage,
      total,
      _date,
    );

    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    if (_step == _FertilizerStep.type) {
      return StreamBuilder<List<FertilizerType>>(
        stream: widget.db.watchFertilizerTypes(),
        builder: (_, snapshot) {
          final types = snapshot.data ?? [];

          final isLoading =
              snapshot.connectionState == ConnectionState.waiting &&
                  types.isEmpty;

          return WizardTypeStep(
            title: 'Выберите удобрение',
            loading: isLoading,
            emptyMessage: 'Типов удобрений пока нет',
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
            controller: _dosage,
            focusNode: _dosageFocus,
            label: 'Дозировка (мг/л)',
          ),
          NumberFormField(
            controller: _total,
            focusNode: _totalFocus,
            label: 'Всего внесено (мг или мл)',
            helperText: 'Объём аквариума: ${widget.aquariumVolume} л',
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
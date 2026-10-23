import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../database/app_database.dart';
import '../widgets/form_helpers.dart';

class AquariumFormScreen extends StatefulWidget {
  final AppDatabase db;
  final Aquarium? aquarium;

  const AquariumFormScreen({
    super.key,
    required this.db,
    this.aquarium,
  });

  @override
  State<AquariumFormScreen> createState() => _AquariumFormScreenState();
}

class _AquariumFormScreenState extends State<AquariumFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final FocusNode _nameFocus = FocusNode();
  final FocusNode _lFocus = FocusNode();
  final FocusNode _wFocus = FocusNode();
  final FocusNode _hFocus = FocusNode();
  final FocusNode _volumeFocus = FocusNode();

  final GlobalKey<FormFieldState<String>> _volumeFieldKey =
      GlobalKey<FormFieldState<String>>();

  String? _currentKeyboardKind;
  bool _switchingKeyboard = false;

  late final TextEditingController _name = TextEditingController(
    text: widget.aquarium?.name ?? '',
  );

  late final TextEditingController _volume = TextEditingController(
    text: widget.aquarium?.volume.toString() ?? '',
  );

  late final TextEditingController _l = TextEditingController(
    text: _formatOptionalNumber(widget.aquarium?.lengthCm),
  );

  late final TextEditingController _w = TextEditingController(
    text: _formatOptionalNumber(widget.aquarium?.widthCm),
  );

  late final TextEditingController _h = TextEditingController(
    text: _formatOptionalNumber(widget.aquarium?.heightCm),
  );

  late DateTime? _launchDate;

  List<_LightEntry> _lights = [];
  bool _isLoadingLights = false;

  @override
  void initState() {
    super.initState();

    _launchDate = widget.aquarium?.launchDate;

    _bindKeyboardSwitch(_nameFocus, 'text');
    _bindKeyboardSwitch(_lFocus, 'number');
    _bindKeyboardSwitch(_wFocus, 'number');
    _bindKeyboardSwitch(_hFocus, 'number');
    _bindKeyboardSwitch(_volumeFocus, 'number');

    if (widget.aquarium == null) {
      requestFocusLater(context, _nameFocus);
    }

    if (widget.aquarium != null) {
      _loadLights();
    }
  }

  @override
  void dispose() {
    _nameFocus.dispose();
    _lFocus.dispose();
    _wFocus.dispose();
    _hFocus.dispose();
    _volumeFocus.dispose();

    _name.dispose();
    _volume.dispose();
    _l.dispose();
    _w.dispose();
    _h.dispose();

    for (final entry in _lights) {
      entry.dispose();
    }

    super.dispose();
  }

  void _bindKeyboardSwitch(FocusNode node, String kind) {
    node.addListener(() {
      if (!node.hasFocus) return;
      if (_switchingKeyboard) return;

      if (_currentKeyboardKind == null) {
        _currentKeyboardKind = kind;
        return;
      }

      if (_currentKeyboardKind == kind) return;

      _switchingKeyboard = true;
      _currentKeyboardKind = kind;

      FocusManager.instance.primaryFocus?.unfocus();

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          _switchingKeyboard = false;
          return;
        }

        node.requestFocus();
        _switchingKeyboard = false;
      });
    });
  }

  Future<void> _loadLights() async {
    final aquarium = widget.aquarium;
    if (aquarium == null) return;

    setState(() => _isLoadingLights = true);

    final lights = await widget.db.lightsOf(aquarium.id);

    if (!mounted) return;

    final entries = lights
        .map(
          (light) => _LightEntry(
            id: light.id,
            typeText: light.lightType,
            powerText: _formatOptionalNumber(light.powerW),
            startTime: light.startTime,
            endTime: light.endTime,
          ),
        )
        .toList();

    for (final entry in entries) {
      _bindKeyboardSwitch(entry.typeFocus, 'text');
      _bindKeyboardSwitch(entry.powerFocus, 'number');
    }

    final oldLights = List<_LightEntry>.from(_lights);

    setState(() {
      _lights = entries;
      _isLoadingLights = false;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (final entry in oldLights) {
        entry.dispose();
      }
    });
  }

  void _addLight() {
    final entry = _LightEntry();

    _bindKeyboardSwitch(entry.typeFocus, 'text');
    _bindKeyboardSwitch(entry.powerFocus, 'number');

    setState(() {
      _lights.add(entry);
    });
  }

  void _removeLight(int index) {
    if (index < 0 || index >= _lights.length) return;

    final entry = _lights[index];

    setState(() {
      _lights.removeAt(index);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      entry.dispose();
    });
  }

  double? _parseNumber(String? value) {
    final normalized = (value ?? '').trim().replaceAll(',', '.');

    if (normalized.isEmpty) {
      return null;
    }

    return double.tryParse(normalized);
  }

  String _capitalizeFirst(String value) {
    final match = RegExp(r'\S').firstMatch(value);

    if (match == null) {
      return value;
    }

    final index = match.start;
    final char = value[index];
    final upper = char.toUpperCase();

    if (char == upper) {
      return value;
    }

    return value.replaceRange(index, index + 1, upper);
  }

  void _showFieldError(String message, FocusNode node) {
    if (!mounted) return;

    FocusManager.instance.primaryFocus?.unfocus();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );

    requestFocusLater(context, node);
  }

  void _calculateVolume() {
    final length = _parseNumber(_l.text);
    final width = _parseNumber(_w.text);
    final height = _parseNumber(_h.text);

    if (length == null || length <= 0) {
      _showFieldError('Укажите длину', _lFocus);
      return;
    }

    if (width == null || width <= 0) {
      _showFieldError('Укажите ширину', _wFocus);
      return;
    }

    if (height == null || height <= 0) {
      _showFieldError('Укажите высоту', _hFocus);
      return;
    }

    final liters = (length * width * height) / 1000.0;
    final litersInt = liters.round();

    if (litersInt <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Получившийся объём меньше 1 литра'),
        ),
      );
      return;
    }

    _volume.text = litersInt.toString();

    _volumeFieldKey.currentState?.didChange(_volume.text);
  }

  Future<void> _pickLaunchDate() async {
    final now = DateTime.now();

    final picked = await showDatePicker(
      context: context,
      initialDate: _launchDate ?? now,
      firstDate: DateTime(1970),
      lastDate: DateTime(now.year + 50, 12, 31),
    );

    if (picked == null || !mounted) return;

    setState(() {
      _launchDate = picked;
    });
  }

  String _formatDate(DateTime? date) {
    if (date == null) {
      return 'Не указана';
    }

    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');

    return '$day.$month.${date.year}';
  }

  Future<void> _pickTime({
    required bool isStart,
    required int index,
  }) async {
    if (index < 0 || index >= _lights.length) return;

    final entry = _lights[index];

    final currentValue = isStart ? entry.startTime : entry.endTime;
    final initialTime = _parseTime(currentValue) ?? TimeOfDay.now();

    final picked = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );

    if (picked == null || !mounted) return;

    setState(() {
      if (isStart) {
        entry.startTime = _formatTime(picked);
      } else {
        entry.endTime = _formatTime(picked);
      }
    });
  }

  TimeOfDay? _parseTime(String value) {
    final parts = value.split(':');

    if (parts.length < 2) {
      return null;
    }

    final hour = int.tryParse(parts[0]);
    final minute = int.tryParse(parts[1]);

    if (hour == null || minute == null) {
      return null;
    }

    if (hour < 0 || hour > 23 || minute < 0 || minute > 59) {
      return null;
    }

    return TimeOfDay(hour: hour, minute: minute);
  }

  String _formatTime(TimeOfDay value) {
    final hour = value.hour.toString().padLeft(2, '0');
    final minute = value.minute.toString().padLeft(2, '0');

    return '$hour:$minute';
  }

  Future<void> _save() async {
    final bool validated = _formKey.currentState?.validate() ?? false;

    if (!validated) {
      if (_name.text.trim().isEmpty) {
        _showFieldError('Укажите название', _nameFocus);
        return;
      }

      final length = _parseNumber(_l.text);
      final width = _parseNumber(_w.text);
      final height = _parseNumber(_h.text);

      if (length == null || length <= 0) {
        _showFieldError('Укажите длину', _lFocus);
        return;
      }

      if (width == null || width <= 0) {
        _showFieldError('Укажите ширину', _wFocus);
        return;
      }

      if (height == null || height <= 0) {
        _showFieldError('Укажите высоту', _hFocus);
        return;
      }

      final volume = int.tryParse(_volume.text.trim());

      if (volume == null || volume <= 0) {
        _showFieldError('Укажите объём', _volumeFocus);
        return;
      }

      return;
    }

    FocusManager.instance.primaryFocus?.unfocus();

    final name = _capitalizeFirst(_name.text.trim());
    final volume = int.tryParse(_volume.text.trim()) ?? 0;

    final length = _parseNumber(_l.text) ?? 0;
    final width = _parseNumber(_w.text) ?? 0;
    final height = _parseNumber(_h.text) ?? 0;

    if (name.isEmpty ||
        volume <= 0 ||
        length <= 0 ||
        width <= 0 ||
        height <= 0) {
      return;
    }

    try {
      if (widget.aquarium == null) {
        final aquariumId = await widget.db.createAquarium(
          name: name,
          volume: volume,
          l: length,
          w: width,
          h: height,
          launchDate: _launchDate,
        );

        for (final entry in _lights) {
          final type = _capitalizeFirst(entry.type.text.trim());

          if (type.isEmpty) {
            continue;
          }

          final power = _parseNumber(entry.power.text) ?? 0;

          final savedId = await widget.db.upsertLight(
            aquariumId,
            entry.id,
            type,
            power,
            entry.startTime,
            entry.endTime,
          );

          entry.id = savedId;
        }

        if (mounted) {
          Navigator.pop(context);
        }

        return;
      }

      final aquarium = widget.aquarium!;

      await widget.db.updateAquarium(
        aquarium.id,
        name: name,
        volume: volume,
        l: length,
        w: width,
        h: height,
        launchDate: _launchDate,
      );

      final keptLightIds = <String>{};

      for (final entry in _lights) {
        final type = _capitalizeFirst(entry.type.text.trim());

        if (type.isEmpty) {
          continue;
        }

        final power = _parseNumber(entry.power.text) ?? 0;

        final savedId = await widget.db.upsertLight(
          aquarium.id,
          entry.id,
          type,
          power,
          entry.startTime,
          entry.endTime,
        );

        entry.id = savedId;
        keptLightIds.add(savedId);
      }

      final oldLights = await widget.db.lightsOf(aquarium.id);

      for (final light in oldLights) {
        if (!keptLightIds.contains(light.id)) {
          await widget.db.removeLight(light.id);
        }
      }

      final updatedAquarium = Aquarium(
        id: aquarium.id,
        name: name,
        volume: volume,
        lengthCm: length,
        widthCm: width,
        heightCm: height,
        launchDate: _launchDate,
        createdAt: aquarium.createdAt,
        updatedAt: DateTime.now(),
        deleted: false,
      );

      if (mounted) {
        Navigator.pop(context, updatedAquarium);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Ошибка сохранения: $e'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }

  _QuietTextFormField _sizeField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String label,
    required FormFieldValidator<String> validator,
  }) {
    return _QuietTextFormField(
      controller: controller,
      focusNode: focusNode,
      label: label,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      textInputAction: TextInputAction.next,
      enableSuggestions: false,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
      ],
      validator: validator,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.aquarium == null
              ? 'Новый аквариум'
              : 'Редактирование аквариума',
        ),
        actions: [
          IconButton(
            onPressed: _save,
            tooltip: 'Сохранить',
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            16,
            16,
            16,
            mq.viewInsets.bottom + 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _QuietTextFormField(
                controller: _name,
                focusNode: _nameFocus,
                label: 'Название',
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.sentences,
                enableSuggestions: true,
                inputFormatters: const [
                  UpperCaseFirstLetterFormatter(),
                ],
                validator: (_) {
                  if (_name.text.trim().isEmpty) {
                    return 'empty';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 16),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: _sizeField(
                      controller: _l,
                      focusNode: _lFocus,
                      label: 'Длина, см',
                      validator: (_) {
                        final value = _parseNumber(_l.text);

                        if (value == null || value <= 0) {
                          return 'invalid';
                        }

                        return null;
                      },
                    ),
                  ),

                  const SizedBox(width: 8),

                  Expanded(
                    child: _sizeField(
                      controller: _w,
                      focusNode: _wFocus,
                      label: 'Ширина, см',
                      validator: (_) {
                        final value = _parseNumber(_w.text);

                        if (value == null || value <= 0) {
                          return 'invalid';
                        }

                        return null;
                      },
                    ),
                  ),

                  const SizedBox(width: 8),

                  Expanded(
                    child: _sizeField(
                      controller: _h,
                      focusNode: _hFocus,
                      label: 'Высота, см',
                      validator: (_) {
                        final value = _parseNumber(_h.text);

                        if (value == null || value <= 0) {
                          return 'invalid';
                        }

                        return null;
                      },
                    ),
                  ),

                  const SizedBox(width: 8),

                  SizedBox(
                    width: 52,
                    height: 56,
                    child: IconButton(
                      onPressed: _calculateVolume,
                      tooltip: 'Рассчитать объём по размерам',
                      icon: const Icon(Icons.calculate, size: 24),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints.expand(),
                      style: IconButton.styleFrom(
                        backgroundColor: colorScheme.surfaceVariant,
                        foregroundColor: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              _QuietTextFormField(
                key: _volumeFieldKey,
                controller: _volume,
                focusNode: _volumeFocus,
                label: 'Объём, л',
                helperText: 'Можно рассчитать кнопкой рядом с размерами',
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                enableSuggestions: false,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (_) {
                  final value = int.tryParse(_volume.text.trim());

                  if (value == null || value <= 0) {
                    return 'invalid';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 16),

              InkWell(
                onTap: _pickLaunchDate,
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'Дата запуска',
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_formatDate(_launchDate)),
                      Icon(
                        Icons.calendar_today,
                        size: 18,
                        color: colorScheme.primary,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              const Divider(height: 1),

              const SizedBox(height: 16),

              Row(
                children: [
                  Icon(
                    Icons.lightbulb,
                    color: colorScheme.primary,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Освещение',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: colorScheme.primary,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              if (_isLoadingLights)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              else
                ..._lights.asMap().entries.map((item) {
                  final index = item.key;
                  final entry = item.value;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Card(
                      // ИСПРАВЛЕНО: surfaceVariant для адаптации к теме
                      color: colorScheme.surfaceVariant,
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: _QuietTextFormField(
                                    controller: entry.type,
                                    focusNode: entry.typeFocus,
                                    label: 'Тип света',
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    enableSuggestions: true,
                                    inputFormatters: const [
                                      UpperCaseFirstLetterFormatter(),
                                    ],
                                  ),
                                ),

                                const SizedBox(width: 8),

                                SizedBox(
                                  width: 90,
                                  child: _QuietTextFormField(
                                    controller: entry.power,
                                    focusNode: entry.powerFocus,
                                    label: 'Вт',
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                                    textInputAction: TextInputAction.next,
                                    enableSuggestions: false,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9.,]'),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(width: 4),

                                IconButton(
                                  onPressed: () => _removeLight(index),
                                  tooltip: 'Удалить',
                                  icon: const Icon(
                                    Icons.delete_outline,
                                    color: Colors.redAccent,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),

                            Row(
                              children: [
                                Expanded(
                                  child: _timeField(
                                    label: 'Включение',
                                    value: entry.startTime,
                                    onTap: () => _pickTime(
                                      isStart: true,
                                      index: index,
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 8),

                                Expanded(
                                  child: _timeField(
                                    label: 'Выключение',
                                    value: entry.endTime,
                                    onTap: () => _pickTime(
                                      isStart: false,
                                      index: index,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),

              const SizedBox(height: 8),

              OutlinedButton.icon(
                onPressed: _addLight,
                icon: const Icon(Icons.add),
                label: const Text('Добавить свет'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _timeField({
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          isDense: true,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(value),
            Icon(
              Icons.access_time,
              size: 18,
              color: colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}

class _LightEntry {
  String? id;

  final TextEditingController type;
  final TextEditingController power;

  final FocusNode typeFocus = FocusNode();
  final FocusNode powerFocus = FocusNode();

  String startTime;
  String endTime;

  bool _disposed = false;

  _LightEntry({
    this.id,
    String typeText = '',
    String powerText = '',
    this.startTime = '08:00',
    this.endTime = '20:00',
  })  : type = TextEditingController(text: typeText),
        power = TextEditingController(text: powerText);

  void dispose() {
    if (_disposed) return;

    _disposed = true;

    type.dispose();
    power.dispose();
    typeFocus.dispose();
    powerFocus.dispose();
  }
}

/// Текстовое поле, которое участвует в валидации формы,
/// но не показывает inline-ошибку под полем.
///
/// Это нужно, чтобы поле не прыгало по высоте при вводе/удалении текста.
class _QuietTextFormField extends FormField<String> {
  _QuietTextFormField({
    super.key,
    required TextEditingController controller,
    required String label,
    String? helperText,
    FocusNode? focusNode,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    TextCapitalization textCapitalization = TextCapitalization.none,
    List<TextInputFormatter>? inputFormatters,
    bool enableSuggestions = false,
    FormFieldValidator<String>? validator,
  }) : super(
          validator: validator,
          initialValue: controller.text,
          builder: (FormFieldState<String> state) {
            return TextField(
              controller: controller,
              focusNode: focusNode,
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              textCapitalization: textCapitalization,
              inputFormatters: inputFormatters,
              enableSuggestions: enableSuggestions,
              smartDashesType: enableSuggestions
                  ? SmartDashesType.enabled
                  : SmartDashesType.disabled,
              smartQuotesType: enableSuggestions
                  ? SmartQuotesType.enabled
                  : SmartQuotesType.disabled,
              textAlignVertical: TextAlignVertical.center,
              onChanged: (value) => state.didChange(value),
              decoration: InputDecoration(
                labelText: label,
                helperText: helperText,
                border: const OutlineInputBorder(),
                isDense: true,
              ),
            );
          },
        );
}

String _formatOptionalNumber(double? value) {
  if (value == null || value == 0) {
    return '';
  }

  if (value == value.roundToDouble()) {
    return value.toInt().toString();
  }

  return value.toString();
}
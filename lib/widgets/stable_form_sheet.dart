import 'package:flutter/material.dart';

import '../core/app_colors.dart';

/// Показывает нижнюю шторку формы так, чтобы она не прыгала
/// при открытии/закрытии клавиатуры.
///
/// [initialKeyboardHint] — предварительная высота подъёма.
/// По умолчанию 300, чтобы убрать первый прыжок при появлении клавиатуры.
Future<void> showStableFormSheet(
  BuildContext ctx,
  Widget form, {
  double initialKeyboardHint = 300,
  bool rememberKeyboardHeight = true,
}) async {
  await showModalBottomSheet(
    context: ctx,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => _StableFormContainer(
      form: form,
      initialKeyboardHint: initialKeyboardHint,
      rememberKeyboardHeight: rememberKeyboardHeight,
    ),
  );
}

class _StableFormContainer extends StatefulWidget {
  /// Запомненная максимальная высота клавиатуры для всего приложения.
  static double _rememberedKeyboardBottom = 0;

  final Widget form;
  final double initialKeyboardHint;
  final bool rememberKeyboardHeight;

  const _StableFormContainer({
    required this.form,
    required this.initialKeyboardHint,
    required this.rememberKeyboardHeight,
  });

  @override
  State<_StableFormContainer> createState() => _StableFormContainerState();
}

class _StableFormContainerState extends State<_StableFormContainer> {
  late double _maxKeyboardBottom;

  @override
  void initState() {
    super.initState();

    _maxKeyboardBottom = widget.initialKeyboardHint;

    if (widget.rememberKeyboardHeight &&
        _StableFormContainer._rememberedKeyboardBottom > _maxKeyboardBottom) {
      _maxKeyboardBottom = _StableFormContainer._rememberedKeyboardBottom;
    }
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final currentKeyboardBottom = mq.viewInsets.bottom;

    // Запоминаем максимальную высоту клавиатуры.
    // Когда клавиатура скрывается, отступ НЕ уменьшается.
    if (currentKeyboardBottom > _maxKeyboardBottom) {
      _maxKeyboardBottom = currentKeyboardBottom;

      if (widget.rememberKeyboardHeight) {
        _StableFormContainer._rememberedKeyboardBottom = currentKeyboardBottom;
      }
    }

    // Учитываем также нижнюю системную панель Android.
    final bottomPadding = _maxKeyboardBottom > mq.viewPadding.bottom
        ? _maxKeyboardBottom
        : mq.viewPadding.bottom;

    // Ограничиваем высоту, чтобы форма не выходила за верх экрана.
    final availableHeight =
        mq.size.height - mq.viewPadding.top - bottomPadding - 24;

    return Padding(
      padding: EdgeInsets.only(
        bottom: bottomPadding,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: availableHeight > 0 ? availableHeight : mq.size.height,
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.sheet,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16),
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: widget.form,
          ),
        ),
      ),
    );
  }
}
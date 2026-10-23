import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Контроллер пошаговой формы.
///
/// Позволяет внутренней форме сообщить внешней шторке,
/// что сейчас ожидается клавиатура.
class WizardFormController {
  final ValueNotifier<bool> keyboardExpected = ValueNotifier<bool>(false);

  void expectKeyboard(bool value) {
    keyboardExpected.value = value;
  }

  void dispose() {
    keyboardExpected.dispose();
  }
}

/// Показывает пошаговую нижнюю шторку.
///
/// Первый шаг обычно — выбор типа.
/// Второй шаг — поля ввода.
Future<void> showWizardFormSheet(
  BuildContext ctx,
  Widget Function(BuildContext context, WizardFormController wizard) builder,
) async {
  final controller = WizardFormController();

  try {
    await showModalBottomSheet(
      context: ctx,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _WizardFormContainer(
        controller: controller,
        child: builder(context, controller),
      ),
    );
  } finally {
    controller.dispose();
  }
}

class _WizardFormContainer extends StatefulWidget {
  static double _rememberedKeyboardBottom = 0;

  final WizardFormController controller;
  final Widget child;

  const _WizardFormContainer({
    required this.controller,
    required this.child,
  });

  @override
  State<_WizardFormContainer> createState() => _WizardFormContainerState();
}

class _WizardFormContainerState extends State<_WizardFormContainer> {
  double _maxKeyboardBottom = 0;

  @override
  void initState() {
    super.initState();

    _maxKeyboardBottom = _WizardFormContainer._rememberedKeyboardBottom;
    widget.controller.keyboardExpected.addListener(_onExpectedChanged);
  }

  @override
  void dispose() {
    widget.controller.keyboardExpected.removeListener(_onExpectedChanged);
    super.dispose();
  }

  void _onExpectedChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    final currentKeyboardBottom = mq.viewInsets.bottom;
    final systemBottom = mq.viewPadding.bottom;

    if (currentKeyboardBottom > _maxKeyboardBottom) {
      _maxKeyboardBottom = currentKeyboardBottom;
      _WizardFormContainer._rememberedKeyboardBottom = currentKeyboardBottom;
    }

    final expectedKeyboard = widget.controller.keyboardExpected.value;

    double targetBottom;

    if (expectedKeyboard) {
      final hint = _maxKeyboardBottom > 0 ? _maxKeyboardBottom : 300.0;

      targetBottom = math.max(
        systemBottom,
        math.max(currentKeyboardBottom, hint),
      );
    } else {
      targetBottom = math.max(systemBottom, currentKeyboardBottom);
    }

    final availableHeight = math.max(
      220.0,
      mq.size.height - mq.viewPadding.top - targetBottom - 32,
    );

    return AnimatedPadding(
      duration: const Duration(milliseconds: 120),
      curve: Curves.easeOut,
      padding: EdgeInsets.fromLTRB(16, 16, 16, targetBottom),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: availableHeight,
        ),
        child: Container(
          decoration: BoxDecoration(
            // ИСПРАВЛЕНО: surface вместо жесткого цвета
            color: colorScheme.surface,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(16),
            ),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
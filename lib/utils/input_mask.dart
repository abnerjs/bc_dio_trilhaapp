import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputMask {
  final TextEditingController textController = TextEditingController();
  final MaskTextInputFormatter formatter;
  final FormFieldValidator<String>? validator;

  InputMask({
    required this.formatter,
    this.validator,
  });
}

final cpfMask = InputMask(
  formatter: MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  ),
  validator: (value) {
    if (value!.isEmpty) {
      return 'Campo obrigatório';
    } else if (value.length < 14) {
      return 'CPF inválido';
    }
    return null;
  },
);

final dateMask = InputMask(
  formatter: MaskTextInputFormatter(
    mask: '##/##/####',
    type: MaskAutoCompletionType.eager,
    filter: {'#': RegExp(r'[0-9]')},
  ),
  validator: (value) {
    if (value == null || value.isEmpty) return null;

    final components = value.split('/');
    if (components.length != 3) return 'Data inválida';

    final day = int.tryParse(components[0]);
    final month = int.tryParse(components[1]);
    final year = int.tryParse(components[2]);
    if (day == null ||
        month == null ||
        year == null ||
        year > DateTime.now().year) return 'Data inválida';

    final date = DateTime(year, month, day);
    if (date.year != year || date.month != month || date.day != day) {
      return 'Data inválida';
    }

    return null;
  },
);

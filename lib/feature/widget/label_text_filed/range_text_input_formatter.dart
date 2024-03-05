import 'package:flutter/services.dart';

class CustomRangeTextInputFormatter extends TextInputFormatter {
  final int min;
  final int max;

  CustomRangeTextInputFormatter({required this.min, required this.max});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }
    final int? value = int.tryParse(newValue.text);
    if (value == null) {
      return oldValue;
    }
    if (value < min || value > max) {
      return oldValue;
    }
    return newValue;
  }
}

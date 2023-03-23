import 'package:flutter/services.dart';

class ExpirationDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length < oldValue.text.length) {
      return newValue;
    }

    String value = newValue.text.replaceAll(RegExp(r'\D'), '');

    if (value.length > 4) {
      value = value.substring(0, 4);
    }

    if (value.length >= 2) {
      final month = int.tryParse(value.substring(0, 2)) ?? 0;
      final year = int.tryParse(value.substring(2)) ?? 0;
      final now = DateTime.now();
      final currentYear = now.year % 100;

      if (month <= 0 || month > 12) {
        value = '$month';
      }
      if (month > 0 &&
          month <= 12 &&
          year >= currentYear - 20 &&
          year <= currentYear + 10) {
        final formattedMonth = month.toString().padLeft(2, '0');
        value = '$formattedMonth/${year.toString().padLeft(2, '0')}';
      }
    }

    return newValue.copyWith(
      text: value,
      selection: TextSelection.collapsed(offset: value.length),
    );
  }
}

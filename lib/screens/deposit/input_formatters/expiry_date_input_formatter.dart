import 'package:flutter/services.dart';

class ExpirationDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // If the user is deleting text, allow it
    if (newValue.text.length < oldValue.text.length) {
      return newValue;
    }

    // Get the new text value
    String value = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Check that the value is not too long
    if (value.length > 4) {
      value = value.substring(0, 4);
    }

    // Format the expiration date as MM/YY
    if (value.length >= 2) {
      final month = int.tryParse(value.substring(0, 2)) ?? 0;
      final year = int.tryParse(value.substring(2)) ?? 0;
      final now = DateTime.now();
      final currentYear = now.year % 100;

      // Validate the month and year
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

    // Return the new text value with the formatter applied
    return newValue.copyWith(
      text: value,
      selection: TextSelection.collapsed(offset: value.length),
    );
  }
}

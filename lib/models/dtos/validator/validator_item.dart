import 'password.dart';

class ValidationItem {
  bool isValid;
  final String text;
  final PasswordValidationError error;

  ValidationItem(this.isValid, this.text, this.error);
}
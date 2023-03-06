import 'package:formz/formz.dart';

enum NameValidationError { invalid }

class Name extends FormzInput<String, NameValidationError> {
  const Name.pure([super.value = '']) : super.pure();

  const Name.dirty([super.value = '']) : super.dirty();

  static final RegExp _emailRegex = RegExp(
      r"^([a-zA-Z]{2,}\s[a-zA-Z]{1,}'?-?[a-zA-Z]{2,}\s?([a-zA-Z]{1,})?)");

  @override
  NameValidationError? validator(String value) {
    return _emailRegex.hasMatch(value) ? null : NameValidationError.invalid;
  }
}


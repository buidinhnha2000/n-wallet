import 'package:formz/formz.dart';

enum PasswordValidationError {
  empty,
  invalid,
  valid,
  lowerCase,
  upperCase,
  length
}

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');

  const Password.dirty([super.value = '']) : super.dirty();
  static final RegExp _upperCaseRegExp = RegExp(r'[A-Z]');
  static final RegExp _lowerCaseRegExp = RegExp(r'[a-z]');
  static final RegExp _length = RegExp(r'^(?=.*[a-z]).{8,}$');

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return PasswordValidationError.empty;
    }
    if (_upperCaseRegExp.hasMatch(value) &&
        _lowerCaseRegExp.hasMatch(value) &&
        _length.hasMatch(value)) {
      if (_upperCaseRegExp.hasMatch(value)) {
        return PasswordValidationError.upperCase;
      }
      if (_lowerCaseRegExp.hasMatch(value)) {
        return PasswordValidationError.lowerCase;
      }
      if (_length.hasMatch(value)) {
        return PasswordValidationError.length;
      }
      return null;
    }
    return PasswordValidationError.invalid;
  }
}

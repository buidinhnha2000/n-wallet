import 'package:formz/formz.dart';

enum PasswordValidationError {
  empty,
  oneUpperCase,
  oneLowerCase,
  oneDigit,
  oneSpecialCharacter,
  minimumEightLength
}

class Password extends FormzInput<String, List<PasswordValidationError>> {
  const Password.pure() : super.pure('');

  const Password.dirty([super.value = '']) : super.dirty();

  static final RegExp _oneUpperCase = RegExp(r'(?=.*?[A-Z])');
  static final RegExp _oneLowerCase = RegExp(r'(?=.*?[a-z])');
  static final RegExp _oneDigit = RegExp(r'(?=.*?[0-9])');
  static final RegExp _oneSpecialCharacter = RegExp(r'(?=.*?[#?!@$%^&*-])');
  static final RegExp _minimumEightLength = RegExp(r'.{8,}');

  @override
  List<PasswordValidationError>? validator(String value) {

    final List<PasswordValidationError> list = [];

    if (!_oneUpperCase.hasMatch(value)) {
      list.add(PasswordValidationError.oneUpperCase);
    }
    if (!_oneLowerCase.hasMatch(value)) {
      list.add(PasswordValidationError.oneLowerCase);
    }
    if (!_oneDigit.hasMatch(value)) {
      list.add(PasswordValidationError.oneDigit);
    }
    if (!_oneSpecialCharacter.hasMatch(value)) {
      list.add(PasswordValidationError.oneSpecialCharacter);
    }
    if (!_minimumEightLength.hasMatch(value)) {
      list.add(PasswordValidationError.minimumEightLength);
    }
    return list.isEmpty ? null : list;
  }
}

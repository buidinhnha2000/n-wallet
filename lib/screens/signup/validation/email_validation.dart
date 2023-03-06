import 'package:formz/formz.dart';

import '../../../common/constants/constants.dart';

enum EmailValidationError { empty, invalid }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure([super.value = '']) : super.pure();

  const Email.dirty([super.value = '']) : super.dirty();

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) {
      return EmailValidationError.empty;
    }
    return EmailRegex.emailRegExp.hasMatch(value)
        ? null
        : EmailValidationError.invalid;
  }
}

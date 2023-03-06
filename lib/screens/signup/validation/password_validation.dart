import 'package:formz/formz.dart';

import '../../../common/constants/constants.dart';

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

  @override
  List<PasswordValidationError> validator(String value) {
    final List<PasswordValidationError> list = [];
    if (!PasswordRegex.oneUpperCase.hasMatch(value)) {
      list.add(PasswordValidationError.oneUpperCase);
    }
    if (!PasswordRegex.oneLowerCase.hasMatch(value)) {
      list.add(PasswordValidationError.oneLowerCase);
    }
    if (!PasswordRegex.oneDigit.hasMatch(value)) {
      list.add(PasswordValidationError.oneDigit);
    }
    if (!PasswordRegex.oneSpecialCharacter.hasMatch(value)) {
      list.add(PasswordValidationError.oneSpecialCharacter);
    }
    if (!PasswordRegex.minimumEightLength.hasMatch(value)) {
      list.add(PasswordValidationError.minimumEightLength);
    }

    return list;
  }
}

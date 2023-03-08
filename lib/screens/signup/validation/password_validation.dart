import 'package:formz/formz.dart';

import '../../../common/constants/constants.dart';

enum PasswordValidationError {
  empty,
  oneUpperCase,
  oneLowerCase,
  oneDigit,
  noneVietnamese,
  oneSpecialCharacter,
  minimumEightLength
}

class Password extends FormzInput<String, List<PasswordValidationError>> {
  const Password.pure() : super.pure('');

  const Password.dirty([super.value = '']) : super.dirty();

  @override
  List<PasswordValidationError>? validator(String value) {
    final List<PasswordValidationError> list = [];
    if (!RegExp(DWalletRegex.oneUpperCase).hasMatch(value)) {
      list.add(PasswordValidationError.oneUpperCase);
    }
    if (!RegExp(DWalletRegex.oneLowerCase).hasMatch(value)) {
      list.add(PasswordValidationError.oneLowerCase);
    }
    if (!RegExp(DWalletRegex.oneDigit).hasMatch(value)) {
      list.add(PasswordValidationError.oneDigit);
    }
    if (!RegExp(DWalletRegex.oneSpecialCharacter).hasMatch(value)) {
      list.add(PasswordValidationError.oneSpecialCharacter);
    }
    if (!RegExp(DWalletRegex.noneVietnamese).hasMatch(value) || value.isEmpty) {
      list.add(PasswordValidationError.noneVietnamese);
    }
    if (!RegExp(DWalletRegex.minimumEightLength).hasMatch(value)) {
      list.add(PasswordValidationError.minimumEightLength);
    }

    return list.isEmpty ? null : list;
  }
}

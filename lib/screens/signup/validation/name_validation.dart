import 'package:formz/formz.dart';

import '../../../common/constants/constants.dart';

enum NameValidationError { invalid }

class Name extends FormzInput<String, NameValidationError> {
  const Name.pure([super.value = '']) : super.pure();

  const Name.dirty([super.value = '']) : super.dirty();

  @override
  NameValidationError? validator(String value) {
    return RegExp(DWalletRegex.nameRegex).hasMatch(value)
        ? null
        : NameValidationError.invalid;
  }
}

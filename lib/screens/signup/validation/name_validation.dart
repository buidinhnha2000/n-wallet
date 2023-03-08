import 'package:formz/formz.dart';

import '../../../common/constants/constants.dart';

enum NameValidationError { empty, invalid }

class Name extends FormzInput<String, NameValidationError> {
  const Name.pure([super.value = '']) : super.pure();

  const Name.dirty([super.value = '']) : super.dirty();

  @override
  NameValidationError? validator(String value) {
    if (value.isEmpty) return NameValidationError.empty;

    return (RegExp(DWalletRegex.nameRegex).hasMatch(value))
        ? null
        : NameValidationError.invalid;
  }
}

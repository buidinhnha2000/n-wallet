import 'package:formz/formz.dart';

import '../../../common/constants/constants.dart';

enum NameValidationError { empty, invalid }

class NameCreditCardValidation extends FormzInput<String, NameValidationError> {
  const NameCreditCardValidation.pure([super.value = '']) : super.pure();

  const NameCreditCardValidation.dirty([super.value = '']) : super.dirty();

  @override
  NameValidationError? validator(String value) {
    if (value.isEmpty) return NameValidationError.empty;
    return (RegExp(DWalletRegex.nameOnlyUpperCaseNoneVietnameseRegex)
            .hasMatch(value))
        ? null
        : NameValidationError.invalid;
  }
}

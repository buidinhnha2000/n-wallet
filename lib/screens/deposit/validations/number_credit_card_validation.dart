import 'package:formz/formz.dart';

import '../../../common/constants/constants.dart';

enum CardType { Master, Visa, Discover, AmericanExpress, Others, Invalid }

class NumberCreditCardValidation extends FormzInput<String, CardType> {
  const NumberCreditCardValidation.pure([super.value = '']) : super.pure();

  const NumberCreditCardValidation.dirty([super.value = '']) : super.dirty();

  @override
  CardType? validator(String value) {
    CardType cardType;
    if (value.startsWith(RegExp(DWalletRegex.master))) {
      cardType = CardType.Master;
    } else if (value.startsWith(RegExp(DWalletRegex.visa))) {
      cardType = CardType.Visa;
    } else if (value.startsWith(RegExp(DWalletRegex.american))) {
      cardType = CardType.AmericanExpress;
    } else if (value.startsWith(RegExp(DWalletRegex.discover))) {
      cardType = CardType.Discover;
    } else if (value.length <= 8) {
      cardType = CardType.Others;
    } else {
      cardType = CardType.Invalid;
    }
    return cardType;
  }
}

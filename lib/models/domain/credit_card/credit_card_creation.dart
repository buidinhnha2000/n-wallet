import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../screens/deposit/validations/validations.dart';

part 'credit_card_creation.freezed.dart';
part 'credit_card_creation.g.dart';

@freezed
class CreditCardCreation with _$CreditCardCreation {
  const CreditCardCreation._();

  const factory CreditCardCreation({
    required String name,
    required String number,
    required String expMonth,
    required String expYear,
    required String cvc,
    CardType? cardType,
  }) = _CreditCardCreation;

  factory CreditCardCreation.fromJson(Map<String, dynamic> json) =>
      _$CreditCardCreationFromJson(json);
}

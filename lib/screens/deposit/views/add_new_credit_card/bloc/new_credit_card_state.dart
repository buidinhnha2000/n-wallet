part of 'new_credit_card_bloc.dart';

@freezed
class NewCreditCardState with _$NewCreditCardState {
  const factory NewCreditCardState({
    required NameCreditCardValidation name,
    required NumberCreditCardValidation cardNumber,
    required String cvc,
    required String expMonth,
    required String expYear,
    required FormzStatus status,
    required CardType? brand,
    String? errorMessage,
    CreditCard? creditCard,
  }) = _NewreditCardState;
}

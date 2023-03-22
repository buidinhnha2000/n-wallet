part of 'new_credit_card_bloc.dart';

abstract class NewCreditCardEvent extends Equatable {
  const NewCreditCardEvent();
}

class NameCreditCardChanged extends NewCreditCardEvent {
  final String name;

  const NameCreditCardChanged(this.name);
  @override
  List<Object?> get props => [name];
}

class NumberCreditCardChanged extends NewCreditCardEvent {
  final String number;

  const NumberCreditCardChanged(this.number);
  @override
  List<Object?> get props => [number];
}

class BrandCreditCardChanged extends NewCreditCardEvent {
  final CardType? brand;

  const BrandCreditCardChanged(this.brand);
  @override
  List<Object?> get props => [brand];
}

class ExpiryDateCreditCardChanged extends NewCreditCardEvent {
  final String expiryDate;

  const ExpiryDateCreditCardChanged(this.expiryDate);

  @override
  List<Object?> get props => [expiryDate];
}

class CvcCreditCardChanged extends NewCreditCardEvent {
  final String cvc;

  const CvcCreditCardChanged(this.cvc);
  @override
  List<Object?> get props => [cvc];
}

class CreditCardSubmitted extends NewCreditCardEvent {
  final CreditCardCreation creditCardCreation;

  const CreditCardSubmitted(this.creditCardCreation);
  @override
  List<Object?> get props => [creditCardCreation];
}

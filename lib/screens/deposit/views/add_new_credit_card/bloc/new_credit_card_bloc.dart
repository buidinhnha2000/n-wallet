import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/domain.dart';
import '../../../../../models/domain/credit_card/credit_card.dart';
import '../../../../../models/domain/credit_card/credit_card_creation.dart';
import '../../../validations/validations.dart';

part 'new_credit_card_bloc.freezed.dart';
part 'new_credit_card_event.dart';
part 'new_credit_card_state.dart';

class NewCreditCardBloc extends Bloc<NewCreditCardEvent, NewCreditCardState> {
  NewCreditCardBloc(this._creditCardRepository)
      : super(const NewCreditCardState(
          name: NameCreditCardValidation.pure(),
          status: FormzStatus.pure,
          cardNumber: NumberCreditCardValidation.pure(),
          cvc: '',
          expMonth: '',
          expYear: '',
          brand: null,
        )) {
    on<NameCreditCardChanged>(_onNameCreditCardChange);
    on<NumberCreditCardChanged>(_onNumberCreditCardChange);
    on<BrandCreditCardChanged>(_onBrandCreditCardChange);
    on<ExpiryDateCreditCardChanged>(_onExpiryDateChange);
    on<CvcCreditCardChanged>(_onCvvCreditCardChange);
    on<CreditCardSubmitted>(_onCreditCardSubmitted);
  }
  final CreditCardRepository _creditCardRepository;

  void _onNameCreditCardChange(
      NameCreditCardChanged event, Emitter<NewCreditCardState> emit) {
    final name = NameCreditCardValidation.dirty(event.name);
    emit(
      state.copyWith(
        name: name,
        status: Formz.validate([name]),
      ),
    );
  }

  void _onNumberCreditCardChange(
      NumberCreditCardChanged event, Emitter<NewCreditCardState> emit) {
    final cardNumber = NumberCreditCardValidation.dirty(event.number);
    emit(state.copyWith(cardNumber: cardNumber));
  }

  void _onBrandCreditCardChange(
      BrandCreditCardChanged event, Emitter<NewCreditCardState> emit) {
    emit(state.copyWith(brand: event.brand));
  }

  void _onExpiryDateChange(
      ExpiryDateCreditCardChanged event, Emitter<NewCreditCardState> emit) {
    emit(
      state.copyWith(
          expMonth: formattedExpiryDate(event.expiryDate, type: 'month'),
          expYear: formattedExpiryDate(event.expiryDate)),
    );
  }

  void _onCvvCreditCardChange(
      CvcCreditCardChanged event, Emitter<NewCreditCardState> emit) {
    emit(state.copyWith(cvc: event.cvc));
  }

  void _onCreditCardSubmitted(
      CreditCardSubmitted event, Emitter<NewCreditCardState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    await Future.delayed(const Duration(seconds: 2));
    final either = await _creditCardRepository.create(event.creditCardCreation);
    either.fold(
      ifLeft: (err) => emit(state.copyWith(
          status: FormzStatus.submissionFailure, errorMessage: err.toString())),
      ifRight: (creditCard) {
        emit(
          state.copyWith(
              status: FormzStatus.submissionSuccess, creditCard: creditCard),
        );
      },
    );
  }
}

String formattedExpiryDate(String number, {String? type}) {
  List<String>? list;
  if (number.length == 5) list = number.split('/');
  if (list == null) return '';
  if (type == 'month') {
    return list[0];
  }
  return list[1];
}

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'transfer_balance_event.dart';
part 'transfer_balance_state.dart';

class TransferBalanceBloc extends Bloc<TransferBalanceEvent, TransferBalanceState> {
  TransferBalanceBloc() : super(const TransferBalanceState(amount: null)){
    on<OnChangedAmount>(_onChangedAmount);
  }

  FutureOr<void> _onChangedAmount(OnChangedAmount event, Emitter<TransferBalanceState> emit) async {
    emit(TransferBalanceState(amount: event.amount));
  }
}

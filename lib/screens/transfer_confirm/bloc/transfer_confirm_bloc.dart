import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/repositories/transfer_repository.dart';
import '../../../models/transfer_balance/transfer_balance.dart';

part 'transfer_confirm_bloc.freezed.dart';
part 'transfer_confirm_event.dart';
part 'transfer_confirm_state.dart';

class TransferConfirmBloc
    extends Bloc<TransferConfirmEvent, TransferConfirmState> {
  TransferConfirmBloc(this._transferRepository)
      : super(const TransferConfirmState(to: 0, amount: 0)) {
    on<TransferIdChanged>(_onTransferIdChanged);
    on<TransferAmountChanged>(_onTransferAmountChanged);
    on<TransferNotesChanged>(_onTransferNotesChanged);
    on<TransferSubmitChanged>(_onTransferSubmitChanged);
  }

  final TransferRepository _transferRepository;

  void _onTransferIdChanged(
      TransferIdChanged event, Emitter<TransferConfirmState> emit) async {
    final to = event.to;
    emit(state.copyWith(to: to));
  }

  void _onTransferAmountChanged(
      TransferAmountChanged event, Emitter<TransferConfirmState> emit) async {
    final amount = event.amount;
    emit(state.copyWith(amount: amount));
  }

  void _onTransferNotesChanged(
      TransferNotesChanged event, Emitter<TransferConfirmState> emit) async {
    final notes = event.notes;
    emit(state.copyWith(notes: notes));
  }

  void _onTransferSubmitChanged(
      TransferSubmitChanged event, Emitter<TransferConfirmState> emit) async {
    await Future.delayed(const Duration(seconds: 4));
    final either = await _transferRepository.transferBalance(
        TransferBalanceJson(
            to: state.to, amount: state.amount, notes: state.notes));

    either.fold(
      ifLeft: (error) =>
          emit(state.copyWith(errorMessage: state.errorMessage),),
      ifRight: (transferBalance) =>
          emit(state.copyWith(transferBalance: transferBalance),),
    );
  }
}

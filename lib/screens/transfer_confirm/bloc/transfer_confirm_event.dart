part of 'transfer_confirm_bloc.dart';

@immutable
abstract class TransferConfirmEvent extends Equatable {
  const TransferConfirmEvent();
}

class TransferIdChanged extends TransferConfirmEvent{
  final int to;
  const TransferIdChanged(this.to);

  @override
  List<Object?> get props => [to];
}

class TransferAmountChanged extends TransferConfirmEvent{
  final double amount;
  const TransferAmountChanged(this.amount);

  @override
  List<Object?> get props => [amount];
}

class TransferNotesChanged extends TransferConfirmEvent{
  final String notes;
  const TransferNotesChanged(this.notes);

  @override
  List<Object?> get props => [notes];
}

class TransferSubmitChanged extends TransferConfirmEvent {
  @override
  List<Object?> get props => [];
}

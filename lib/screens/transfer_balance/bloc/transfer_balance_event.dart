part of 'transfer_balance_bloc.dart';

@immutable
abstract class TransferBalanceEvent extends Equatable{
}

class OnChangedAmount extends TransferBalanceEvent{
  final double amount;

  OnChangedAmount(this.amount);

  @override
  List<Object?> get props => [amount];
}
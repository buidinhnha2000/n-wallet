part of 'transfer_balance_bloc.dart';


class TransferBalanceState extends Equatable{
  final double? amount;

  const TransferBalanceState({required this.amount});

  TransferBalanceState copyWith(
      {double? amount,}) {
    return TransferBalanceState(
      amount: amount ?? this.amount,
    );
  }
  @override
  List<Object?> get props => [amount];



}


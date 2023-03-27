import 'package:equatable/equatable.dart';

import '../transfer_balance/transfer_balance.dart';

class TransferBalance extends Equatable {
  final int? to;
  final double? amount;
  final String? notes;

  const TransferBalance(this.to, this.amount, this.notes);

  @override
  List<Object?> get props => [to, amount, notes];

  factory TransferBalance.fromDTO(TransferBalanceJson? dto) => TransferBalance(dto?.to, dto?.amount,
      dto?.notes);
}

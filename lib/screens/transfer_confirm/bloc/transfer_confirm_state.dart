part of 'transfer_confirm_bloc.dart';

@freezed
class TransferConfirmState with _$TransferConfirmState{
  const factory TransferConfirmState({
    required int to,
    required double amount,
    String? notes,
    TransferBalanceJson? transferBalance,
    String? errorMessage,
  }) = _TransferConfirmState;
}

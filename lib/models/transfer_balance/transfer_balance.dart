import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer_balance.g.dart';
part 'transfer_balance.freezed.dart';

@freezed
class TransferBalanceJson with _$TransferBalanceJson {
  const factory TransferBalanceJson({
    int? to,
    double? amount,
    String? notes,
  }) = _TransferBalanceJson;

  factory TransferBalanceJson.fromJson(Map<String, Object?> json) =>
      _$TransferBalanceJsonFromJson(json);
}

@freezed
class TransferBalanceJsonWrapper with _$TransferBalanceJsonWrapper {
  const factory TransferBalanceJsonWrapper({
    TransferBalanceJson? data,
  }) = _TransferBalanceJsonWrapper;

  factory TransferBalanceJsonWrapper.fromJson(Map<String, Object?> json) =>
      _$TransferBalanceJsonWrapperFromJson(json);
}

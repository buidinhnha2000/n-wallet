import 'package:freezed_annotation/freezed_annotation.dart';

part 'balance.g.dart';
part 'balance.freezed.dart';

@freezed
class BalanceJson with _$BalanceJson {
  const factory BalanceJson({
    int? id,
    String? updatedAt,
    String? createdAt,
    String? deletedAt,
    String? value,
    String? status,
  }) = _BalanceJson;

  factory BalanceJson.fromJson(Map<String, Object?> json) =>
      _$BalanceJsonFromJson(json);
}

@freezed
class BalanceJsonWrapper with _$BalanceJsonWrapper {
  const factory BalanceJsonWrapper({
    BalanceJson? data,
  }) = _BalanceJsonWrapper;

  factory BalanceJsonWrapper.fromJson(Map<String, Object?> json) =>
      _$BalanceJsonWrapperFromJson(json);
}

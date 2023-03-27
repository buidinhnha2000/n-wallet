import 'package:freezed_annotation/freezed_annotation.dart';

import 'history_receiver.dart';
import 'history_sender.dart';

part 'history_data.g.dart';
part 'history_data.freezed.dart';

@freezed
class HistoryDataJson with _$HistoryDataJson {
  const factory HistoryDataJson({
    int? id,
    String? updatedAt,
    String? createdAt,
    String? deletedAt,
    double? amount,
    String? status,
    String? typeTransaction,
    String? notes,
    @JsonKey(name: 'receiver') List<HistoryReceiverJson>? historyReceiverJson,
    @JsonKey(name: 'sender') List<HistorySenderJson>? historySenderJson,

  }) = _HistoryDataJson;

  factory HistoryDataJson.fromJson(Map<String, Object?> json) =>
      _$HistoryDataJsonFromJson(json);
}

@freezed
class HistoryDataJsonWrapper with _$HistoryDataJsonWrapper {
  const factory HistoryDataJsonWrapper({
    HistoryDataJson? historyDataJson,
  }) = _HistoryDataJsonWrapper;

  factory HistoryDataJsonWrapper.fromJson(Map<String, Object?> json) => _$HistoryDataJsonWrapperFromJson(json);
}
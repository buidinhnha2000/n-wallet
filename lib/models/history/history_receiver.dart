import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_receiver.g.dart';
part 'history_receiver.freezed.dart';

@freezed
class HistoryReceiverJson with _$HistoryReceiverJson {
  const factory HistoryReceiverJson({
    int? id,
    String? updatedAt,
    String? createdAt,
    String? deletedAt,
    String? email,
    String? name,

  }) = _HistoryReceiverJson;

  factory HistoryReceiverJson.fromJson(Map<String, Object?> json) =>
      _$HistoryReceiverJsonFromJson(json);
}

@freezed
class HistoryReceiverJsonWrapper with _$HistoryReceiverJsonWrapper {
  const factory HistoryReceiverJsonWrapper({
    HistoryReceiverJson? receiverJson,
  }) = _HistoryReceiverJsonWrapper;

  factory HistoryReceiverJsonWrapper.fromJson(Map<String, Object?> json) => _$HistoryReceiverJsonWrapperFromJson(json);
}
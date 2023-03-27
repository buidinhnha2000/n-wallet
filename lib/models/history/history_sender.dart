import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_sender.g.dart';
part 'history_sender.freezed.dart';

@freezed
class HistorySenderJson with _$HistorySenderJson {
  const factory HistorySenderJson({
    int? id,
    String? updatedAt,
    String? createdAt,
    String? deletedAt,
    String? email,
    String? name,

  }) = _HistorySenderJson;

  factory HistorySenderJson.fromJson(Map<String, Object?> json) =>
      _$HistorySenderJsonFromJson(json);
}

@freezed
class HistorySenderJsonWrapper with _$HistorySenderJsonWrapper {
  const factory HistorySenderJsonWrapper({
    HistorySenderJson? receiverJson,
  }) = _HistorySenderJsonWrapper;

  factory HistorySenderJsonWrapper.fromJson(Map<String, Object?> json) => _$HistorySenderJsonWrapperFromJson(json);
}
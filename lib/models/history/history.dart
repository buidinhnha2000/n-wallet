import 'package:freezed_annotation/freezed_annotation.dart';
import 'history_data.dart';

part 'history.g.dart';
part 'history.freezed.dart';

@freezed
class HistoryJson with _$HistoryJson {
  const factory HistoryJson({
    int? total,
    @JsonKey(name: 'data') List<HistoryDataJson>? historyDataJson,
  }) = _HistoryJson;

  factory HistoryJson.fromJson(Map<String, Object?> json) =>
      _$HistoryJsonFromJson(json);
}

@freezed
class HistoryJsonWrapper with _$HistoryJsonWrapper {
  const factory HistoryJsonWrapper({
    HistoryJson? historyJson,
  }) = _HistoryJsonWrapper;

  factory HistoryJsonWrapper.fromJson(Map<String, Object?> json) => _$HistoryJsonWrapperFromJson(json);
}

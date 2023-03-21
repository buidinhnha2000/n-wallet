import 'package:freezed_annotation/freezed_annotation.dart';
import '../profile/profile.dart';

part 'search.g.dart';
part 'search.freezed.dart';

@freezed
class SearchJson with _$SearchJson {
  const factory SearchJson({
    int? total,
    @JsonKey(name: 'data') List<ProfileJson>? profile,
  }) = _SearchJson;

  factory SearchJson.fromJson(Map<String, Object?> json) =>
      _$SearchJsonFromJson(json);
}

@freezed
class SearchJsonWrapper with _$SearchJsonWrapper {
  const factory SearchJsonWrapper({
    SearchJson? search,
  }) = _SearchJsonWrapper;

  factory SearchJsonWrapper.fromJson(Map<String, Object?> json) => _$SearchJsonWrapperFromJson(json);
}
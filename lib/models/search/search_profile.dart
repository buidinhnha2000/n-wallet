import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_profile.g.dart';
part 'search_profile.freezed.dart';

@freezed
class SearchProfileJson with _$SearchProfileJson {
  const factory SearchProfileJson({
    int? id,
    String? updatedAt,
    String? createdAt,
    String? deletedAt,
    String? email,
    String? name,
    String? avatar,
    String? fullname,
    String? gender,
    String? phone,
    String? address,
    String? dob,
  }) = _SearchProfileJson;

  factory SearchProfileJson.fromJson(Map<String, Object?> json) =>
      _$SearchProfileJsonFromJson(json);
}

@freezed
class SearchProfileJsonWrapper with _$SearchProfileJsonWrapper {
  const factory SearchProfileJsonWrapper({
    SearchProfileJson? profile,
  }) = _SearchProfileJsonWrapper;

  factory SearchProfileJsonWrapper.fromJson(Map<String, Object?> json) => _$SearchProfileJsonWrapperFromJson(json);
}
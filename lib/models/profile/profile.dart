import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.g.dart';
part 'profile.freezed.dart';

@freezed
class ProfileJson with _$ProfileJson {
  const factory ProfileJson({
    String? email,
    String? name,
    String? avatar,
    String? fullname,
    String? gender,
    String? phone,
    String? address,
    String? dob,
  }) = _ProfileJson;

  factory ProfileJson.fromJson(Map<String, Object?> json) =>
      _$ProfileJsonFromJson(json);
}

@freezed
class ProfileJsonWrapper with _$ProfileJsonWrapper {
  const factory ProfileJsonWrapper({
    ProfileJson? profile,
  }) = _ProfileJsonWrapper;

  factory ProfileJsonWrapper.fromJson(Map<String, Object?> json) => _$ProfileJsonWrapperFromJson(json);
}
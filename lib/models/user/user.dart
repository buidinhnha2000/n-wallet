import 'package:freezed_annotation/freezed_annotation.dart';

import '../account/account.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    String? accessToken,
    String? refreshToken,
    Account? account,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}

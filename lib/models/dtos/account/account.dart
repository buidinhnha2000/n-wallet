import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.g.dart';
part 'account.freezed.dart';

@freezed
class Account with _$Account {
  const factory Account({
    int? id,
    String? email,
    String? name,
    String? password,
    dynamic facebook_id,
    dynamic google_id,
    dynamic apple_id
}) = _Account;
  factory Account.fromJson(Map<String, Object?> json) => _$AccountFromJson(json);
}

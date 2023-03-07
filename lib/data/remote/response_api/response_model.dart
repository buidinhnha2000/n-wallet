import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_model.freezed.dart';
part 'response_model.g.dart';

@freezed
class ResponseApi with _$ResponseApi {
  const factory ResponseApi({
    int? statusCode,
    String? message,
    int? timestamp,
    String? path,
  }) = _ResponseApi;

  factory ResponseApi.fromJson(Map<String, Object?> json) =>
      _$ResponseApiFromJson(json);
}

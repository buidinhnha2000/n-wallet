import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_card_response_dto.freezed.dart';
part 'credit_card_response_dto.g.dart';

@freezed
class CreditCardResponseDTO with _$CreditCardResponseDTO {
  const CreditCardResponseDTO._();

  const factory CreditCardResponseDTO({
    int? id,
    String? expYear,
    String? expMonth,
    String? codeLast4,
    String? country,
    String? brand,
  }) = _CreditCardResponseDTO;

  factory CreditCardResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$CreditCardResponseDTOFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../dtos/credit_card/credit_card_response_dto.dart';

part 'credit_card.freezed.dart';
part 'credit_card.g.dart';

@freezed
class CreditCard with _$CreditCard {
  const CreditCard._();

  const factory CreditCard({
    int? id,
    String? expYear,
    String? expMonth,
    String? codeLast4,
    String? country,
    String? brand,
  }) = _CreditCard;

  factory CreditCard.fromJson(Map<String, Object?> json) =>
      _$CreditCardFromJson(json);

  factory CreditCard.fromDTO(CreditCardResponseDTO dto) => CreditCard(
        id: dto.id,
        codeLast4: dto.codeLast4,
        country: dto.country,
        brand: dto.brand,
        expYear: dto.expYear,
        expMonth: dto.expMonth,
      );

  CreditCardResponseDTO toDTO() => CreditCardResponseDTO(
        id: id,
        brand: brand,
        country: country,
        codeLast4: codeLast4,
        expMonth: expMonth,
        expYear: expYear,
      );
}

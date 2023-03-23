import '../../../../common/either.dart';
import '../../../../common/error.dart';
import '../../../../models/domain/credit_card/credit_card_creation.dart';
import '../../../../models/dtos/credit_card/credit_card_response_dto.dart';

abstract class CreditCardDataSource {
  Future<Either<DataSourceError, CreditCardResponseDTO>> create(
      CreditCardCreation creditCardCreation);
}

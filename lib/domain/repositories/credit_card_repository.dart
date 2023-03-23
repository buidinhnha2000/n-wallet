import '../../common/either.dart';
import '../../common/error.dart';
import '../../models/domain/credit_card/credit_card.dart';
import '../../models/domain/credit_card/credit_card_creation.dart';

abstract class CreditCardRepository {
  Future<Either<DataSourceError, CreditCard?>> create(
      CreditCardCreation creditCardCreation);
}

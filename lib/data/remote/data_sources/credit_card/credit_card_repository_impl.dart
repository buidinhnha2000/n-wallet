import '../../../../common/either.dart';
import '../../../../common/error.dart';
import '../../../../domain/domain.dart';
import '../../../../models/domain/credit_card/credit_card.dart';
import '../../../../models/domain/credit_card/credit_card_creation.dart';
import 'credit_card_data_source.dart';

class CreditCardRepositoryImpl extends CreditCardRepository {
  final CreditCardDataSource creditCardDataSource;

  CreditCardRepositoryImpl(this.creditCardDataSource);

  @override
  Future<Either<DataSourceError, CreditCard>> create(
      CreditCardCreation creditCardCreation) async {
    final response = await creditCardDataSource.create(creditCardCreation);
    return response.map((value) => CreditCard.fromDTO(value));
  }
}

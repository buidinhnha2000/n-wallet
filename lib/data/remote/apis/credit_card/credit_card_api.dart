import '../../../../common/either.dart';
import '../../../../common/error.dart';
import '../../../../models/domain/credit_card/credit_card_creation.dart';
import '../../../../models/dtos/credit_card/credit_card_response_dto.dart';
import '../../data_sources/credit_card/credit_card_data_source.dart';
import '../api.dart';
import '../api_path.dart';

class CreditCardApi extends Api implements CreditCardDataSource {
  CreditCardApi(super.dio);

  @override
  Future<Either<DataSourceError, CreditCardResponseDTO>> create(
      CreditCardCreation creditCardCreation) {
    return withTimeoutRequest(() async {
      final response =
          await dio.post(ApiPath.createCreditCard, data: creditCardCreation);
      return CreditCardResponseDTO.fromJson(response.data);
    });
  }
}

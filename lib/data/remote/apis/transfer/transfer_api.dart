import '../../../../common/either.dart';
import '../../../../common/error.dart';
import '../../../../models/transfer_balance/transfer_balance.dart';
import '../../data_sources/transfer/transfer_data_source.dart';
import '../api.dart';
import '../api_path.dart';

class TransferApi extends Api implements TransferDataSource {
  TransferApi(super.dio);

  Future<Either<DataSourceError, TransferBalanceJson?>> transferBalance(
      TransferBalanceJson transferBalanceJson) async {
    return withTimeoutRequest(() async {
      final response = await dio.post(
        ApiPath.transfer,
        data: TransferBalanceJson(
            to: transferBalanceJson.to,
            amount: transferBalanceJson.amount,
            notes: transferBalanceJson.notes
        ),
      );
      return TransferBalanceJson.fromJson(response.data);
    });
  }
}

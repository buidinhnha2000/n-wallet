import '../../../../common/either.dart';
import '../../../../common/error.dart';
import '../../../../models/transfer_balance/transfer_balance.dart';

abstract class TransferDataSource {
  Future<Either<DataSourceError, TransferBalanceJson?>> transferBalance(
      TransferBalanceJson transferBalanceJson);
}

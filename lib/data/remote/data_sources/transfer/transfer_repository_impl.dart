import '../../../../common/either.dart';
import '../../../../common/error.dart';
import '../../../../domain/repositories/transfer_repository.dart';
import '../../../../models/transfer_balance/transfer_balance.dart';
import 'transfer_data_source.dart';

class TransferRepositoryImpl implements TransferRepository {
  final TransferDataSource transferDataSource;

  const TransferRepositoryImpl(this.transferDataSource);

  @override
  Future<Either<DataSourceError, TransferBalanceJson?>> transferBalance(
      TransferBalanceJson transferBalanceJson) =>
      transferDataSource.transferBalance(transferBalanceJson);
}
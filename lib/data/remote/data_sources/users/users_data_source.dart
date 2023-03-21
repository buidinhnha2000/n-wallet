import '../../../../common/either.dart';
import '../../../../common/error.dart';
import '../../../../models/balance/balance.dart';
import '../../../../models/profile/profile.dart';
import '../../../../models/search/search.dart';

abstract class UserDataSource {

  Future<Either<DataSourceError, BalanceJson?>> getBalance();

  Future<Either<DataSourceError, ProfileJson?>> getProfile();

  Future<Either<DataSourceError, SearchJson?>> getSearch(String? wordSearch);
}

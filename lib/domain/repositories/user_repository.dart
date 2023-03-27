import '../../common/either.dart';
import '../../common/error.dart';
import '../../models/domain/balance.dart';
import '../../models/domain/history/history.dart';
import '../../models/domain/profile.dart';
import '../../models/domain/search.dart';

abstract class UserRepository {
  Future<Either<DataSourceError, Balance>> getBalance();

  Future<Either<DataSourceError, Profile>> getProfile();

  Future<Either<DataSourceError, Search>> getSearch(String? wordSearch);

  Future<Either<DataSourceError, History>> getHistory();

}
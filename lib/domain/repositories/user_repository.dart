import '../../common/either.dart';
import '../../common/error.dart';
import '../../models/domain/balance.dart';
import '../../models/domain/profile.dart';

abstract class UserRepository {
  Future<Either<DataSourceError, Balance>> getBalance();
  Future<Either<DataSourceError, Profile>> getProfile();
}
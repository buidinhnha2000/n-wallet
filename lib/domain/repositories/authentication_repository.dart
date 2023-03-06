import '../../common/either.dart';
import '../../common/error.dart';
import '../../models/account/account.dart';
import '../../models/models.dart';

abstract class AuthenticationRepository {
  Future<Either<DataSourceError, User?>> signup(Account account);

  Future<Either<DataSourceError, bool?>> mailExists(String? email);
}

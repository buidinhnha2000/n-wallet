import '../../../../common/either.dart';
import '../../../../common/error.dart';
import '../../../../models/models.dart';

abstract class AuthenticationDataSource {
  Future<Either<DataSourceError, User?>> signup(Account account);

  Future<Either<DataSourceError, bool?>> mailExists(String? email);

  Future<Either<DataSourceError, User?>> signin(Account account);

  Future<Either<DataSourceError, User?>> signinWithGoogle(String? token);
}

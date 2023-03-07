import '../../../../common/either.dart';
import '../../../../common/error.dart';
import '../../../../domain/domain.dart';
import '../../../../models/account/account.dart';
import '../../../../models/user/user.dart';
import 'authentication_data_source.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationDataSource authenticationDataSource;

  const AuthenticationRepositoryImpl(this.authenticationDataSource);

  @override
  Future<Either<DataSourceError, User?>> signup(Account account) =>
      authenticationDataSource.signup(account);

  @override
  Future<Either<DataSourceError, bool?>> mailExists(String? email) =>
      authenticationDataSource.mailExists(email);
}

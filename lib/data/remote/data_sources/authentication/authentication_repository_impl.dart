import '../../../../common/either.dart';
import '../../../../common/error.dart';
import '../../../../domain/domain.dart';
import '../../../../models/models.dart';
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

  @override
  Future<Either<DataSourceError, User?>> signin(Account account) =>
      authenticationDataSource.signin(account);

  @override
  Future<Either<DataSourceError, User?>> signinWithGoogle(String? token) =>
      authenticationDataSource.signinWithGoogle(token);
}

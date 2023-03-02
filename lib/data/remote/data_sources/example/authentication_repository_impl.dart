import '../../../../common/either.dart';
import '../../../../common/error.dart';
import '../../../../domain/repositories/authentication_repository.dart';
import '../../../../models/dtos/user/user.dart';
import 'authentication_data_source.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationDataSource authDataSource;

  const AuthenticationRepositoryImpl(this.authDataSource);

  @override
  Future<Either<DataSourceError, User>> login(String email, String password) =>
      authDataSource.login(email, password);
}

import '../../../../common/either.dart';
import '../../../../common/error.dart';
import '../../../../domain/domain.dart';


import '../../../../models/user/user.dart';
import 'authentication_data_source.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationDataSource authenticationDataSource;

  const AuthenticationRepositoryImpl(this.authenticationDataSource);

  @override
  Future<Either<DataSourceError, User?>> signup(
          String? email, String? name, String? password) =>
      authenticationDataSource.signup(email, name, password);
}

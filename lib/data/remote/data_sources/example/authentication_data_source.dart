import '../../../../common/either.dart';
import '../../../../common/error.dart';
import '../../../../models/dtos/user/user.dart';

abstract class AuthenticationDataSource {
  Future<Either<DataSourceError, User>> login(String email, String password);
}

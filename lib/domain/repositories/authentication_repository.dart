import '../../common/either.dart';
import '../../common/error.dart';
import '../../models/dtos/account/account.dart';
import '../../models/dtos/user/user.dart';

abstract class AuthenticationRepository {
  Future<Either<DataSourceError, User>> login(Account account);
}

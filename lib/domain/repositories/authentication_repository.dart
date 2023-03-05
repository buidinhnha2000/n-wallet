import '../../common/either.dart';
import '../../common/error.dart';
import '../../models/models.dart';

abstract class AuthenticationRepository {
  Future<Either<DataSourceError, User?>> signup(
      String? email, String? name, String? password);
}

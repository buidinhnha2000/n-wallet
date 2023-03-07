import '../../../../common/either.dart';
import '../../../../common/error.dart';
import '../../../../models/account/account.dart';
import '../../../../models/models.dart';
import '../../data_sources/authentication/authentication_data_source.dart';
import '../../remote.dart';
import '../api.dart';
import '../api_path.dart';

class AuthenticationApi extends Api implements AuthenticationDataSource {
  AuthenticationApi(super.dio);

  @override
  Future<Either<DataSourceError, User?>> signin(
     Account account) async {
    return withTimeoutRequest(() async {
      final response = await dio.post('http://10.10.32.10:3001/api/auth/signin',
          data: Account(email: account.email, password: account.password));
      return User.fromJson(response.data);
    });
  }
  Future<Either<DataSourceError, User?>> signup(Account account) async {
    return withTimeoutRequest(() async {
      final response = await dio.post(ApiPath.signup,
          data: Account(
              email: account.email,
              name: account.name,
              password: account.password));
      return User.fromJson(response.data);
    });
  }

  @override
  Future<Either<DataSourceError, bool?>> mailExists(String? email) async {
    return withTimeoutRequest(() async {
      final response =
          await dio.get(ApiPath.userExists, queryParameters: {'email': email});
      return response.data == 'true';
    });
  }
}

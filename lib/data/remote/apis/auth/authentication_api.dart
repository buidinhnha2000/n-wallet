import '../../../../common/either.dart';
import '../../../../common/error.dart';
import '../../../../models/dtos/account/account.dart';
import '../../../../models/dtos/user/user.dart';
import '../../data_sources/example/authentication_data_source.dart';
import '../api.dart';
import '../api_path.dart';

class AuthenticationApi extends Api implements AuthenticationDataSource {
  AuthenticationApi(super.dio);

  @override
  Future<Either<DataSourceError, User>> login(
     Account account) async {
    return withTimeoutRequest(() async {
      final response = await dio.post(ApiPath.signin,
          data: Account(email: account.email, password: account.password));
      return User.fromJson(response.data);
    });
  }
}

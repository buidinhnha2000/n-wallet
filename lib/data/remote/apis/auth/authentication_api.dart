import '../../../../common/either.dart';
import '../../../../common/error.dart';
import '../../../../models/dtos/user/user.dart';
import '../../data_sources/example/authentication_data_source.dart';
import '../api.dart';
import '../api_path.dart';

class AuthenticationApi extends Api implements AuthenticationDataSource {
  AuthenticationApi(super.dio);

  @override
  Future<Either<DataSourceError, User>> login(
      String email, String password) async {
    return withTimeoutRequest(() async {
      final response = await dio.post(ApiPath.signin,
          data: Map.from({'email': email, 'password': password}));
      return User.fromJson(response.data);
    });
  }
}

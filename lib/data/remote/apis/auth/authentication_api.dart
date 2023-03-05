import '../../../../common/either.dart';
import '../../../../common/error.dart';

import '../../../../models/models.dart';
import '../../remote.dart';
import '../api.dart';
import '../api_path.dart';

class AuthenticationApi extends Api implements AuthenticationDataSource {
  AuthenticationApi(super.dio);

  @override
  Future<Either<DataSourceError, User?>> signup(String? email, String? name, String? password) async {
    return withTimeoutRequest(() async {
      final response = await dio.post(ApiPath.signup,
          data: Map.from({'email': email, 'name': name, 'password': password}));
      return User.fromJson(response.data);
    });
  }
}

import '../../../../common/either.dart';
import '../../../../common/error.dart';
import '../../../../models/balance/balance.dart';
import '../../../../models/profile/profile.dart';
import '../../data_sources/users/users_data_source.dart';
import '../api.dart';
import '../api_path.dart';

class UserApi extends Api implements UserDataSource {
  UserApi(super.dio);

  @override
  Future<Either<DataSourceError, ProfileJson?>> getProfile() async {
    return withTimeoutRequest(() async {
      final data = await dio.get(ApiPath.profile);
      return ProfileJsonWrapper.fromJson(data.data).profile;
    });
  }

  @override
  Future<Either<DataSourceError, BalanceJson?>> getBalance() async {
    return withTimeoutRequest(() async {
      final data = await dio.get(ApiPath.balance);
      final balance = BalanceJson.fromJson(data.data);
      return balance;
    });
  }
}
import '../../../../common/either.dart';
import '../../../../common/error.dart';
import '../../../../domain/repositories/user_repository.dart';
import '../../../../models/domain/balance.dart';
import '../../../../models/domain/history/history.dart';
import '../../../../models/domain/profile.dart';
import '../../../../models/domain/search.dart';
import '../../../local/local.dart';
import '../../../local/local_storage.dart';
import 'users_data_source.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl(this.userDataSource, this.storage);

  final UserDataSource userDataSource;
  final LocalStorage storage;

  @override
  Future<Either<DataSourceError, Balance>> getBalance() async =>
      (await userDataSource.getBalance()).map((value) => Balance.fromDTO(value));

  @override
  Future<Either<DataSourceError, Profile>> getProfile() async =>
      (await userDataSource.getProfile()).map((value) => Profile.fromDTO(value));

  @override
  Future<Either<DataSourceError, Search>> getSearch(String? wordSearch) async =>
      (await userDataSource.getSearch(wordSearch))
          .map((value) => Search.fromDTO(value));

  @override
  Future<Either<DataSourceError, History>> getHistory() async =>
      (await userDataSource.getHistory()).map((value) => History.fromDTO(value));
}

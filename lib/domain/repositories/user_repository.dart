import '../../common/base_state.dart';
import 'package:uuid/uuid.dart';

class UserRepository {
  User? _user;

  Future<User?> getUser() async {
    if (_user != null) return _user;
    return Future.delayed(
      const Duration(milliseconds: 300),
          () => _user = User(const Uuid().v4()),
    );
  }
// @override
// Future<List<User>> getUser() async {
//   try {
//     final response = await dio.get('');
//     final List<dynamic> jsonUser = response.data as List<dynamic>;
//     final users = jsonUser.map((e) => User.fromJson(e)).toList();
//     return users;
//   } on DioError catch (e) {
//     throw e.error;
//   }
// }

}



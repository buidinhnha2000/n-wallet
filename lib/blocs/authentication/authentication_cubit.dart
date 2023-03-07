import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../data/local/local.dart';
import '../../di/service_locator.dart';

class AuthenticationCubit extends HydratedCubit<String?> {
  AuthenticationCubit() : super(null);

  final LocalStorage localStorage = ServiceLocator.instance.inject();

  void setToken(String token) async {
    await localStorage.setString(LocalStorageKey.token, token);
    emit(token);
  }

  void setUnToken(String token) async {
    await localStorage.remove(LocalStorageKey.token);
    emit(null);
  }

  @override
  String? fromJson(Map<String, dynamic> json) =>
      json[LocalStorageKey.token] as String?;

  @override
  Map<String, dynamic>? toJson(String? state) => {LocalStorageKey.token: state};
}

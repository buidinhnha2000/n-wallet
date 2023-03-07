import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../data/local/local.dart';
import '../../di/service_locator.dart';

class AuthenticationCubit extends HydratedCubit<String?> {
  AuthenticationCubit() : super(null);

  final LocalStorage localStorage = ServiceLocator.instance.inject();

  void setAccessToken(String token) async {
    await localStorage.setString(LocalStorageKey.accessToken, token);
    emit(token);
  }

  void setRefreshTokenToken(String token) async {
    await localStorage.setString(LocalStorageKey.refreshToken, token);
    emit(token);
  }

  void unsetToken() {
    localStorage.remove(LocalStorageKey.accessToken);
    emit(null);
  }

  @override
  String? fromJson(Map<String, dynamic> json) =>
      json[LocalStorageKey.accessToken] as String?;

  @override
  Map<String, dynamic>? toJson(String? state) =>
      {LocalStorageKey.accessToken: state};
}

import 'dart:convert';

import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../data/local/local.dart';
import '../../di/service_locator.dart';
import '../../models/models.dart';

class AuthenticationCubit extends HydratedCubit<User?> {
  AuthenticationCubit() : super(null);

  final LocalStorage localStorage = ServiceLocator.instance.inject();

  void setUserLogged(User? user) {
    final jsonString = jsonEncode(user?.toJson());
    localStorage.setString(LocalStorageKey.user, jsonString);
    emit(user);
  }

  User? getUserLogged() {
    final jsonString = localStorage.getString(LocalStorageKey.user);
    if (jsonString != null) {
      return User.fromJson(jsonDecode(jsonString));
    }
    return null;
  }

  void unsetUserLogged() {
    localStorage.remove(LocalStorageKey.user);
    clear();
    emit(null);
  }

  @override
  User? fromJson(Map<String, dynamic> json) => User.fromJson(json);

  @override
  Map<String, dynamic>? toJson(User? state) => state?.toJson();
}

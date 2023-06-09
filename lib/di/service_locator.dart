import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_flavor.dart';
import '../data/local/local_storage.dart';
import '../data/remote/apis/auth/authentication_api.dart';
import '../data/remote/apis/transfer/transfer_api.dart';
import '../data/remote/apis/credit_card/credit_card_api.dart';
import '../data/remote/apis/users/user_api.dart';
import '../data/remote/data_sources/authentication/authentication_repository_impl.dart';
import '../data/remote/data_sources/transfer/transfer_data_source.dart';
import '../data/remote/data_sources/transfer/transfer_repository_impl.dart';
import '../data/remote/data_sources/credit_card/credit_card_data_source.dart';
import '../data/remote/data_sources/credit_card/credit_card_repository_impl.dart';
import '../data/remote/data_sources/users/user_repository_impl.dart';
import '../data/remote/data_sources/users/users_data_source.dart';
import '../data/remote/remote.dart';
import '../domain/domain.dart';
import '../domain/repositories/transfer_repository.dart';

part 'network_module.dart';

class ServiceLocator {
  ServiceLocator._();

  static final _getIt = GetIt.instance;

  static final instance = ServiceLocator._();

  void registerSingleton<T extends Object>(
    T instance, {
    String? instanceName,
    bool? signalsReady,
    DisposingFunc<T>? onDispose,
  }) {
    _getIt.registerSingleton<T>(
      instance,
      instanceName: instanceName,
      signalsReady: signalsReady,
      dispose: onDispose,
    );
  }

  void registerSingletonAsync<T extends Object>(
    Future<T> Function() asyncInstance, {
    String? instanceName,
    bool? signalsReady,
    DisposingFunc<T>? onDispose,
  }) {
    _getIt.registerSingletonAsync(
      asyncInstance,
      instanceName: instanceName,
      signalsReady: signalsReady,
      dispose: onDispose,
    );
  }

  void registerLazySingleton<T extends Object>(
    T Function() asyncInstance, {
    String? instanceName,
    bool? signalsReady,
    DisposingFunc<T>? onDispose,
  }) {
    _getIt.registerLazySingleton(
      asyncInstance,
      instanceName: instanceName,
      dispose: onDispose,
    );
  }

  void registerLazySingletonAsync<T extends Object>(
    Future<T> Function() asyncInstance, {
    String? instanceName,
    bool? signalsReady,
    DisposingFunc<T>? onDispose,
  }) {
    _getIt.registerLazySingletonAsync(
      asyncInstance,
      instanceName: instanceName,
      dispose: onDispose,
    );
  }

  T inject<T extends Object>({String? instanceName}) =>
      _getIt.get<T>(instanceName: instanceName);

  Future<T> injectAsync<T extends Object>({String? instanceName}) =>
      _getIt.getAsync<T>(instanceName: instanceName);
}

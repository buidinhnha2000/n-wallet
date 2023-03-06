part of 'service_locator.dart';

extension ServiceLocatorX on ServiceLocator {
  void configureNetworkModule(AppFlavor flavor) {
    registerSingleton<AuthenticationDataSource>(
        AuthenticationApi(inject<DioClient>().authDio));
    registerSingleton<AuthenticationRepository>(AuthenticationRepositoryImpl(inject()));
  }

  void configureLocalStorage() {
    registerLazySingletonAsync<LocalStorage>(() async =>
        LocalStorageImplement(await SharedPreferences.getInstance()));
  }
}

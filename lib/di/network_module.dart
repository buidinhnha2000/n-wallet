part of 'service_locator.dart';

extension ServiceLocatorX on ServiceLocator {
  Future<void> configureNetworkModule(AppFlavor flavor) async {
    registerSingleton<AuthenticationDataSource>(
        AuthenticationApi(inject<DioClient>().dio));
    registerSingleton<AuthenticationRepository>(
        AuthenticationRepositoryImpl(inject()));
  }

  void configureLocalStorage(SharedPreferences prefs) {
    registerSingleton<LocalStorage>(LocalStorageImplement(prefs));
  }
}

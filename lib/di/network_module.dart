part of 'service_locator.dart';

extension ServiceLocatorX on ServiceLocator {
  void configureNetworkModule(AppFlavor flavor) {
    registerSingleton<ExampleDataSource>(
        ExampleAuthApi(inject<DioClient>().authDio));
    registerSingleton<ExampleRepository>(ExampleRepositoryImpl(inject()));
  }

  void configureLocalStorage() {
    registerLazySingletonAsync<LocalStorage>(() async =>
        LocalStorageImplement(await SharedPreferences.getInstance()));
  }
}

part of 'service_locator.dart';

extension ServiceLocatorX on ServiceLocator {
  Future<void> configureNetworkModule(AppFlavor flavor) async {
    registerSingleton<AuthenticationDataSource>(
        AuthenticationApi(inject<DioClient>().dio));
    registerSingleton<AuthenticationRepository>(
        AuthenticationRepositoryImpl(inject()));

    registerSingleton<UserDataSource>(UserApi(inject<DioClient>().authDio));
    registerSingleton<UserRepository>(UserRepositoryImpl(inject(), inject()));

    registerSingleton<TransferDataSource>(TransferApi(inject<DioClient>().authDio));
    registerSingleton<TransferRepository>(TransferRepositoryImpl(inject()));
    registerSingleton<CreditCardDataSource>(
        CreditCardApi(inject<DioClient>().authDio));
    registerSingleton<CreditCardRepository>(CreditCardRepositoryImpl(inject()));
  }

  void configureLocalStorage(SharedPreferences prefs) {
    registerSingleton<LocalStorage>(LocalStorageImplement(prefs));
  }
}

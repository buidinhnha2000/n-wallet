import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_flavor.dart';
import 'data/local/local.dart';
import 'data/remote/remote.dart';
import 'di/service_locator.dart';
import 'initialize.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final serviceLocator = ServiceLocator.instance;
  serviceLocator.configureLocalStorage(await SharedPreferences.getInstance());
  serviceLocator.registerSingleton<AuthenticationInterceptor>(
      AuthenticationInterceptor(serviceLocator.inject<LocalStorage>()));
  final dioClient = DioClient(
      baseUrl: AppFlavor.staging.baseUrl,
      authenticationInterceptor: serviceLocator.inject());
  serviceLocator.registerSingleton(dioClient);
  serviceLocator.configureNetworkModule(AppFlavor.staging);

  initialize();
}

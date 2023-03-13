import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_flavor.dart';
import 'data/remote/remote.dart';
import 'di/service_locator.dart';
import 'firebase_options.dart';
import 'initialize.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final serviceLocator = ServiceLocator.instance;
  serviceLocator.configureLocalStorage(
    await SharedPreferences.getInstance(),
  );

  final dioClient = DioClient(
    baseUrl: AppFlavor.staging.baseUrl,
    authenticationInterceptor: AuthenticationInterceptor(
      localStorage: ServiceLocator.instance.inject(),
      authenticationApi: AuthenticationApi(Dio()),
    ),
  );
  serviceLocator.registerSingleton(dioClient);
  await serviceLocator.configureNetworkModule(AppFlavor.staging);

  initialize();
}

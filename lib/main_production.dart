import 'package:flutter/material.dart';

import 'app_flavor.dart';
import 'data/remote/dio.dart';
import 'di/service_locator.dart';
import 'initialize.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dioClient = DioClient(baseUrl: AppFlavor.production.baseUrl);

  final serviceLocator = ServiceLocator.instance;
  serviceLocator.registerSingleton(dioClient);
  serviceLocator.configureNetworkModule(AppFlavor.production);

  initialize();
}

import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'app/app.dart';
import 'app/app_bloc_observer.dart';
import 'common/error_screen.dart';
import 'firebase_options.dart';

const String authDioInstance = 'auth_dio';
const String noAuthDioInstance = 'no_auth_dio';

Future<void> initialize() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = (FlutterErrorDetails details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  EquatableConfig.stringify = true;
  Bloc.observer = AppBlocObserver();

  ErrorWidget.builder = (details) => ErrorScreen(details: details);
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationSupportDirectory(),
  );

  runZonedGuarded(
    () => runApp(const App()),
    (Object error, StackTrace stackTrace) =>
        log(error.toString(), stackTrace: stackTrace),
  );
}

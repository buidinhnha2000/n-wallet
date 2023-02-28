import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/home/home.dart';
import '../screens/login/login.dart';
import '../screens/onboarding/bloc/onboarding_bloc.dart';
import '../screens/onboarding/onboarding.dart';

abstract class AppRoutes {
  static const login = 'login';
  static const home = 'home';
  static const onboarding = 'onboarding';
}

abstract class AppNavigation {
  static Route<dynamic>? onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return AppPageRoute((_) => const HomeScreen(), settings);
      case AppRoutes.login:
        return AppPageRoute((_) => const LoginScreen(), settings);
      case AppRoutes.onboarding:
        return AppPageRoute(
            (_) => BlocProvider(
                  create: (context) => OnBoardingScreenCubit(),
                  child: const OnBoardingScreen(),
                ),
            settings);
      default:
        throw 'Cannot find destination route';
    }
  }
}

/// This function ensures the RouteSettings parameter will be pass into a destination route
/// to make sure every destination has a settings
// ignore: non_constant_identifier_names
MaterialPageRoute<T> AppPageRoute<T>(
  Widget Function(BuildContext context) builder,
  RouteSettings settings, {
  bool maintainState = true,
  bool fullscreenDialog = false,
}) =>
    MaterialPageRoute(
      builder: builder,
      settings: settings,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
    );

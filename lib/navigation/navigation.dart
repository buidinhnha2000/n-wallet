import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/home/home.dart';
import '../screens/onboarding/bloc/onboarding_bloc.dart';
import '../screens/onboarding/onboarding.dart';
import '../screens/signin_signup_options/signin/signin.dart';
import '../screens/signin_signup_options/signin_signup_options/signin_signup_options.dart';
import '../screens/signup/signup.dart';

abstract class AppRoutes {
  static const home = 'home';
  static const onboarding = 'onboarding';

  static const signOption = 'signOption';
  static const signIn = 'signIn';
  static const signUp = 'signup';
}

abstract class AppNavigation {
  static Route<dynamic>? onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return AppPageRoute((_) => const HomeScreen(), settings);
      case AppRoutes.onboarding:
        return AppPageRoute(
            (_) => BlocProvider(
                  create: (_) => OnBoardingScreenCubit(),
                  child: const OnBoardingScreen(),
                ),
            settings);
      case AppRoutes.signOption:
        return AppPageRoute((_) => const SignInSignUpOption(), settings);
      case AppRoutes.signIn:
        return AppPageRoute((_) => const SignInScreen(), settings);
      case AppRoutes.signUp:
        return AppPageRoute((_) => const SignUpScreen(), settings);
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

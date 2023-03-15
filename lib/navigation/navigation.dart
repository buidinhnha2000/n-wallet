import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/home/home.dart';
import '../screens/onboarding/bloc/onboarding_bloc.dart';
import '../screens/onboarding/onboarding.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/signin_signup_options/signin/signin.dart';
import '../screens/signin_signup_options/signin_signup_options/signin_signup_options.dart';
import '../screens/signup/signup.dart';
import '../screens/welcome/welcome_screen.dart';

abstract class AppRoutes {
  static const welcome = 'welcome';
  static const onboarding = 'onboarding';
  static const homeScreen = 'homeScreen';
  static const home = 'home';
  static const profile = 'profile';

  static const signOption = 'signOption';
  static const signIn = 'signIn';
  static const signUpEmailStep = 'signUpEmailStep';
  static const signUpNameStep = 'signUpNameStep';
  static const signUpPasswordStep = 'signUpPasswordStep';
}

abstract class AppNavigation {
  static Route<dynamic>? onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.welcome:
        return AppPageRoute((_) => const WelcomeScreen(), settings);
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
      case AppRoutes.signUpEmailStep:
        return AppPageRoute((_) => const SignUpEmailStep(), settings);
      case AppRoutes.signUpNameStep:
        return AppPageRoute((_) => const SignUpNameStep(), settings);
      case AppRoutes.signUpPasswordStep:
        return AppPageRoute((_) => const SignUpPasswordStep(), settings);

      case AppRoutes.home:
        return AppPageRoute((_) => const Home(), settings);
      case AppRoutes.homeScreen:
        return AppPageRoute((_) => const HomeScreen(), settings);
      case AppRoutes.profile:
        return AppPageRoute((_) => const ProfileScreen(), settings);
      default:
        throw 'Cannot find destination route';
    }
  }
}

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

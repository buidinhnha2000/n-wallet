import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/authentication/authentication_cubit.dart';
import '../blocs/social_authentication/social_authentication_cubit.dart';
import '../di/service_locator.dart';
import '../domain/domain.dart';
import '../l10n/l10n.dart';
import '../navigation/navigation.dart';
import '../screens/onboarding/cubit/onboarding_cubit.dart';
import '../screens/signup/bloc/signup_bloc.dart';
import '../theme/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationRepository>(
          create: (BuildContext context) =>
              ServiceLocator.instance.inject<AuthenticationRepository>(),
        ),
        RepositoryProvider<UserRepository>(
          create: (BuildContext context) =>
              ServiceLocator.instance.inject<UserRepository>(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthenticationCubit(),
          ),
          BlocProvider(
            create: (context) => OnBoardingCubit(),
          ),
          BlocProvider(
            create: (context) => SignUpBloc(
              RepositoryProvider.of<AuthenticationRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => SocialAuthenticationCubit(
              RepositoryProvider.of<AuthenticationRepository>(context),
            ),
          )
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final onBoardingState = context.read<OnBoardingCubit>().state;
    final authenticateState =
        context.read<AuthenticationCubit>().state?.accessToken;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        onGenerateRoute: AppNavigation.onGeneratedRoute,
        initialRoute: onBoardingState.onBoardingUnCompleted
            ? AppRoutes.onboarding
            : authenticateState != null
                ? AppRoutes.home
                : AppRoutes.signOption);
  }
}

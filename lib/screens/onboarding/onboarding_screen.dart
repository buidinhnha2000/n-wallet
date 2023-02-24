import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/onboarding/onboarding_cubit.dart';
import '../../navigation/navigation.dart';


class OnboardingScreeen extends StatelessWidget {
  const OnboardingScreeen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: ElevatedButton(
        child:  Text('Login'),
        onPressed: () {
          context.read<OnboardingCubit>().setNavigationOnboarding();
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoutes.login, (route) => false);
        },
      ),),
    );
  }
}

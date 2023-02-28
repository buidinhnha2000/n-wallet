import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

enum OnboardingPage {
  fastestPayment(0),
  safestPlatform(1),
  payAnything(2);

  const OnboardingPage(this.pageIndex);

  final int pageIndex;
}

class OnBoardingScreenCubit extends Cubit<OnboardingPage> {
  final PageController pageController = PageController(initialPage: 0);

  OnBoardingScreenCubit() : super(OnboardingPage.fastestPayment);

  void changePage(int index) {
    switch (index) {
      case 0:
        emit(OnboardingPage.fastestPayment);
        break;
      case 1:
        emit(OnboardingPage.safestPlatform);
        break;
      case 2:
        emit(OnboardingPage.payAnything);
        break;
    }
  }
}

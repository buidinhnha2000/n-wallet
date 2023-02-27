import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../common/base_state.dart';

part 'onboarding_event.dart';

part 'onboarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  final PageController pageController = PageController(initialPage: 0);

  OnBoardingBloc() : super(PageViewOnBoardingState(page: 0)) {
    on<OnBoardingEvent>(_handlePageView);
  }

  void _handlePageView(OnBoardingEvent event, Emitter<OnBoardingState> emit) {
    if (event is PageIndexChanged) {
      emit(state.copyWith(page: event.pageIndex));
      }
  }
}

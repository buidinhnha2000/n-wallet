part of 'onboarding_bloc.dart';

abstract class OnBoardingEvent extends Equatable {
  const OnBoardingEvent();
}

class PageIndexChanged extends OnBoardingEvent {
  final int pageIndex;

  const PageIndexChanged(this.pageIndex);

  @override
  List<Object?> get props => [pageIndex];
}
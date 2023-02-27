part of 'onboarding_bloc.dart';

abstract class OnBoardingState extends BaseState {
  OnBoardingState(this.page);

  final int page;

  OnBoardingState copyWith({int page});
}

class PageViewOnBoardingState extends OnBoardingState {
  PageViewOnBoardingState({required int page}) : super(page);

  @override
  // TODO: implement props
  List<Object?> get props => [page];

  @override
  OnBoardingState copyWith({int? page}) {
    return PageViewOnBoardingState(
      page: page ?? this.page
    );
  }
}

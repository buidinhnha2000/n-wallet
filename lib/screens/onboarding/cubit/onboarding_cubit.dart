import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
part 'onboarding_state.dart';

class OnBoardingCubit extends HydratedCubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingState.initial());

  void completedOnBoarding() {
    emit(state.copyWith(isOnBoardingComplete: false));
  }

  @override
  OnBoardingState fromJson(Map<String, dynamic> json) => OnBoardingState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(OnBoardingState state) => state.toJson();

}

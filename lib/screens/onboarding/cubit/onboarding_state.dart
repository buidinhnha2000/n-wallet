part of 'onboarding_cubit.dart';

class OnBoardingState extends Equatable {
  final bool onBoardingUnCompleted;

  const OnBoardingState({required this.onBoardingUnCompleted});

  factory OnBoardingState.initial() {
    return const OnBoardingState(onBoardingUnCompleted: true);
  }

  @override
  List<Object?> get props => [onBoardingUnCompleted];

  OnBoardingState copyWith({bool? isOnBoardingComplete}) {
    return OnBoardingState(
        onBoardingUnCompleted:
            isOnBoardingComplete ?? onBoardingUnCompleted);
  }

  factory OnBoardingState.fromJson(Map<String, dynamic> json) =>
      OnBoardingState(
          onBoardingUnCompleted: json['isOnBoardingComplete'] as bool);

  Map<String, dynamic> toJson() => {
        'isOnBoardingComplete': onBoardingUnCompleted,
      };
}

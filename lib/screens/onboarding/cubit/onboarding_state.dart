part of 'onboarding_cubit.dart';

class OnBoardingState extends Equatable {
  final bool isOnBoardingComplete;

  const OnBoardingState({required this.isOnBoardingComplete});

  factory OnBoardingState.initial() {
    return const OnBoardingState(isOnBoardingComplete: true);
  }

  @override
  List<Object?> get props => [isOnBoardingComplete];

  OnBoardingState copyWith({bool? isOnBoardingComplete}) {
    return OnBoardingState(
        isOnBoardingComplete:
            isOnBoardingComplete ?? this.isOnBoardingComplete);
  }

  factory OnBoardingState.fromJson(Map<String, dynamic> json) =>
      OnBoardingState(
          isOnBoardingComplete: json['isOnBoardingComplete'] as bool);

  Map<String, dynamic> toJson() => {
        'isOnBoardingComplete': isOnBoardingComplete,
      };
}

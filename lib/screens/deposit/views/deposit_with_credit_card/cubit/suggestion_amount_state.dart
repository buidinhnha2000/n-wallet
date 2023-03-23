part of 'suggestion_amount_cubit.dart';

abstract class SuggestionAmountState extends Equatable {
  final String smallestAmount;
  final String middleAmount;
  final String biggestAmount;

  const SuggestionAmountState(
    this.smallestAmount,
    this.middleAmount,
    this.biggestAmount,
  );

  SuggestionAmountState copyWith(
      {String? smallestAmount, String? middleAmount, String? biggestAmount});
}

class SuggestionAmountInitial extends SuggestionAmountState {
  const SuggestionAmountInitial({
    required String smallestAmount,
    required String middleAmount,
    required String biggestAmount,
  }) : super(smallestAmount, middleAmount, biggestAmount);

  @override
  List<Object> get props => [smallestAmount, middleAmount, biggestAmount];

  @override
  SuggestionAmountState copyWith(
      {String? smallestAmount, String? middleAmount, String? biggestAmount}) {
    return SuggestionAmountInitial(
      smallestAmount: smallestAmount ?? this.smallestAmount,
      middleAmount: middleAmount ?? this.middleAmount,
      biggestAmount: biggestAmount ?? this.biggestAmount,
    );
  }
}

class SuggestionAmountChanged extends SuggestionAmountState {
  const SuggestionAmountChanged({
    required String smallestAmount,
    required String middleAmount,
    required String biggestAmount,
  }) : super(smallestAmount, middleAmount, biggestAmount);

  @override
  List<Object> get props => [smallestAmount, middleAmount, biggestAmount];

  @override
  SuggestionAmountState copyWith(
      {String? smallestAmount, String? middleAmount, String? biggestAmount}) {
    return SuggestionAmountChanged(
      smallestAmount: smallestAmount ?? this.smallestAmount,
      middleAmount: middleAmount ?? this.middleAmount,
      biggestAmount: biggestAmount ?? this.biggestAmount,
    );
  }
}

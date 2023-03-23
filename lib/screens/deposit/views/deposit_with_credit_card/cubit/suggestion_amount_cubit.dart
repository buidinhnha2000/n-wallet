import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'suggestion_amount_state.dart';

class SuggestionAmountCubit extends Cubit<SuggestionAmountState> {
  SuggestionAmountCubit()
      : super(
          const SuggestionAmountInitial(
            smallestAmount: '',
            middleAmount: '',
            biggestAmount: '',
          ),
        );
}

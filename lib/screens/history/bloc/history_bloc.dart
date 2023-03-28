import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/error.dart';
import '../../../domain/repositories/user_repository.dart';
import '../../../models/domain/history/history.dart';
import '../../../models/history/history_data.dart';

part 'history_event.dart';

part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc(this.userRepository)
      : super(const HistoryState(history: null, twoMonth: null)) {
    on<LoadHistory>(_onLoadHistory);
  }

  final UserRepository userRepository;

  void _onLoadHistory(LoadHistory event, Emitter<HistoryState> emit) async {
    await userRepository.getHistory().then(
          (value) => value.fold(
            ifLeft: (error) => emit(state.copyWith(error: error)),
            ifRight: (history) => emit(
              state.copyWith(history: history, error: null),
            ),
          ),
        );

    await userRepository.getHistory().then(
          (value) => value.fold(
              ifLeft: (err) => print('cc'),
              ifRight: (value) {

                List<HistoryDataJson>? listHistoryTwoMonth = state.history?.historyDataJson;
                int length = state.history?.historyDataJson?.length ?? 0;
                final lastDay = state.history?.historyDataJson?[length - 1].createdAt;
                double totalAmount = 0.0;
                DateTime end = DateTime.parse(lastDay ?? '');
                DateTime start = end.subtract(const Duration(days: 60));

                for (int i = 0; i < length; i++) {
                  if (listHistoryTwoMonth != null) {
                    DateTime createdAt =
                    DateTime.parse(listHistoryTwoMonth[i].createdAt ?? '');
                    if (createdAt.isAfter(start)) {
                      totalAmount += listHistoryTwoMonth[i].amount!;
                    }
                  }
                }
                emit(state.copyWith(twoMonth: totalAmount, error: null));
              },
          )
        );
  }
}

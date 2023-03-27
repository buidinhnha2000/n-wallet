import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/error.dart';
import '../../../domain/repositories/user_repository.dart';
import '../../../models/domain/history/history.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc(this.userRepository) : super(const HistoryState(history: null)) {
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
  }
}

part of 'history_bloc.dart';

class HistoryState extends Equatable {
  const HistoryState({required this.history, this.error});

  final History? history;
  final DataSourceError? error;

  HistoryState copyWith(
      {History? history,
        DataSourceError? error}) {
    return HistoryState(
      history: history ?? this.history,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [history, error];
}
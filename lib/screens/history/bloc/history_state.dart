part of 'history_bloc.dart';

class HistoryState extends Equatable {
  const HistoryState({required this.history, this.error, required this.twoMonth});

  final History? history;
  final DataSourceError? error;
  final double? twoMonth;

  HistoryState copyWith(
      {History? history,
        DataSourceError? error,
        double? twoMonth,
      }) {
    return HistoryState(
      history: history ?? this.history,
      error: error ?? this.error,
      twoMonth: twoMonth ?? this.twoMonth,
    );

  }

  @override
  List<Object?> get props => [history, error, twoMonth];
}
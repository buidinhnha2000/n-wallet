part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({required this.balances, this.error});

  final Balance? balances;
  final DataSourceError? error;

  HomeState copyWith(
      {Balance? balances,
        DataSourceError? error}) {
    return HomeState(
      balances: balances ?? this.balances,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [balances, error];
}

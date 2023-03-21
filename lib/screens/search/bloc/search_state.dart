part of 'search_bloc.dart';


class SearchState extends Equatable{
  final Search? search;
  final DataSourceError? error;

  const SearchState({required this.search, this.error});

  SearchState copyWith(
      {Search? search,
        DataSourceError? error}) {
    return SearchState(
      search: search ?? this.search,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [search, error];
}

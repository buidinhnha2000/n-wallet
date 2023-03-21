part of 'search_bloc.dart';


abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class LoadSearch extends SearchEvent {
  final String wordSearch;

  const LoadSearch(this.wordSearch);
  @override
  List<Object?> get props => [wordSearch];
}

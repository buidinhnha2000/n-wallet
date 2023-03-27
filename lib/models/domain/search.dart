import 'package:equatable/equatable.dart';
import '../search/search.dart';
import '../search/search_profile.dart';

class Search extends Equatable {
  final int? total;
  final List<SearchProfileJson>? searchProfile;

  const Search({required this.total, required this.searchProfile});

  @override
  List<Object?> get props => [total, searchProfile];

  factory Search.fromDTO(SearchJson? dto) => Search(total: dto?.total, searchProfile: dto?.searchProfile,
  );
}
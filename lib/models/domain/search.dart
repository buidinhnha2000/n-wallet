import 'package:equatable/equatable.dart';
import '../profile/profile.dart';
import '../search/search.dart';

class Search extends Equatable {
  final int? total;
  final List<ProfileJson>? profile;

  const Search({required this.total, required this.profile});

  @override
  List<Object?> get props => [total, profile];

  factory Search.fromDTO(SearchJson? dto) => Search(total: dto?.total, profile: dto?.profile,
  );
}
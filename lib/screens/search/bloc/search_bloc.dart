import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/domain.dart';
import '../../../common/error.dart';
import '../../../models/domain/search.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final UserRepository userRepository;

  SearchBloc(this.userRepository) : super(const SearchState(search: null)) {
    on<LoadSearch>(_onLoadSearch);
  }

  void _onLoadSearch(LoadSearch event, Emitter<SearchState> emit) async {
    await userRepository.getSearch(event.wordSearch).then(
          (value) => value.fold(
        ifLeft: (error) => emit(state.copyWith(error: error)),
        ifRight: (search) => emit(
          state.copyWith(search: search, error: null),
        ),
      ),
    );
  }
}
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/error.dart';
import '../../../domain/domain.dart';
import '../../../models/domain/balance.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserRepository userRepository;

  HomeBloc(this.userRepository)
      : super(const HomeState(balances: null)) {
    on<LoadHome>(_onLoadHome);
  }

  Future<String?> _onLoadHome(LoadHome event, Emitter<HomeState> emit) async {
    await userRepository.getBalance().then((value) => value.fold(
        ifLeft: (error) => emit(state.copyWith(error: error)),
        ifRight: (balances) =>
            emit(state.copyWith(balances: balances, error: null))));
  }
}

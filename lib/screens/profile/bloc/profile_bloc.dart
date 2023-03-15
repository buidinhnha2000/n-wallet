
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../common/error.dart';
import '../../../domain/repositories/user_repository.dart';
import '../../../models/domain/profile.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository userRepository;

  ProfileBloc(this.userRepository)
      : super(const ProfileState(profiles: null)) {
    on<LoadProfile>(_onLoadProfile);
  }

  Future<String?> _onLoadProfile(LoadProfile event, Emitter<ProfileState> emit) async {
    await userRepository.getProfile().then((value) => value.fold(
        ifLeft: (error) => emit(state.copyWith(error: error)),
        ifRight: (profiles) =>
            emit(state.copyWith(profiles: profiles, error: null))));
  }
}

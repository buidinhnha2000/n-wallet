part of 'profile_bloc.dart';

@immutable
class ProfileState extends Equatable{
  const ProfileState({required this.profiles, this.error});

  final Profile? profiles;
  final DataSourceError? error;

  ProfileState copyWith(
      {Profile? profiles,
        DataSourceError? error}) {
    return ProfileState(
      profiles: profiles ?? this.profiles,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [profiles, error];
}



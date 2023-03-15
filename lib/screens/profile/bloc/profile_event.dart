part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent extends Equatable{
  const ProfileEvent();
}

class LoadProfile extends ProfileEvent{
  @override
  List<Object?> get props => [];
}

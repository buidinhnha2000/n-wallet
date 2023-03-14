part of 'social_authentication_cubit.dart';

abstract class SocialAuthenticationState extends Equatable {}

class SocialAuthenticationInitial extends SocialAuthenticationState {
  @override
  List<Object?> get props => [];
}

class SocialAuthenticationLogged extends SocialAuthenticationState {
  final User user;

  SocialAuthenticationLogged(this.user);
  @override
  List<Object?> get props => [user];
}

class SocialAuthenticationNotLogged extends SocialAuthenticationState {
  final DataSourceError error;

  SocialAuthenticationNotLogged(this.error);
  @override
  List<Object?> get props => [error];
}

class SocialAuthenticationError extends SocialAuthenticationState {
  final String? errorMessage;

  SocialAuthenticationError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

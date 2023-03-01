part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent extends BaseState{}

class SignInEmailChanged extends SignInEvent{
  final String email;
  SignInEmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

class SignInPasswordChanged extends SignInEvent{
  final String password;

  SignInPasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}
class SignInSubmitted extends SignInEvent {

  @override
  List<Object?> get props => [];
}

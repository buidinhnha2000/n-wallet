part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable{}

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




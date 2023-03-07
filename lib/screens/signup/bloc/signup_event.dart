part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();
}

class EmailChanged extends SignupEvent {
  final String email;

  const EmailChanged({required this.email});

  @override
  List<Object?> get props => [email];
}

class NameChanged extends SignupEvent {
  final String name;

  const NameChanged({required this.name});

  @override
  List<Object?> get props => [name];
}

class PasswordChanged extends SignupEvent {
  final String password;

  const PasswordChanged({required this.password});

  @override
  List<Object?> get props => [password];
}

class SignupSubmitted extends SignupEvent {
  @override
  List<Object?> get props => [];
}

class SignupEmailExists extends SignupEvent {
  @override
  List<Object?> get props => [];
}

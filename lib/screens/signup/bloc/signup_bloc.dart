import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/domain.dart';
import '../validation/validations.dart';

part 'signup_bloc.freezed.dart';
part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignUpState> {
  SignupBloc(this._authenticationRepository)
      : super(const SignUpState(
            email: Email.pure(),
            name: Name.pure(),
            password: Password.pure(),
            status: FormzStatus.pure)) {
    on<EmailChanged>(onEmailChange);
    on<NameChanged>(onNameChange);
    on<PasswordChanged>(onPasswordChange);
    on<SignupSubmitted>(onSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;

  FutureOr<void> onEmailChange(EmailChanged event, Emitter<SignUpState> emit) {
    final email = Email.dirty(event.email);
    print(email.valid);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([email, state.name, state.password]),
    ));

    // emit(state.copyWith(
    //   email: email,
    //   status: Formz.validate([email, state.name, state.password]),
    // ));
  }

  FutureOr<void> onNameChange(NameChanged event, Emitter<SignUpState> emit) {
    final name = Name.dirty(event.name);
    emit(state.copyWith(
        name: name,
        status: Formz.validate([state.email, state.password, name])));
  }

  FutureOr<void> onPasswordChange(
      PasswordChanged event, Emitter<SignUpState> emit) {
    final password = Password.dirty(event.password);

    emit(state.copyWith(
        password: password,
        status: Formz.validate([state.email, state.name, password])));
  }

  FutureOr<void> onSubmitted(
      SignupSubmitted event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final either = await _authenticationRepository.signup(
        state.email.value, state.name.value, state.password.value);

    either.fold(
      ifLeft: (err) => emit(state.copyWith(
          status: FormzStatus.submissionFailure, errorMessage: err.toString())),
      ifRight: (user) =>
          emit(state.copyWith(status: FormzStatus.submissionSuccess)),
    );
  }
}

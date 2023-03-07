import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../domain/repositories/authentication_repository.dart';
import '../../../../models/account/account.dart';
import '../../../../models/user/user.dart';
import '../../../signup/validation/email_validation.dart';
import '../../../signup/validation/password_validation.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

part 'sign_in_bloc.freezed.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthenticationRepository _authenticationRepository;

  SignInBloc(this._authenticationRepository)
      : super(const SignInState(
            email: Email.pure(),
            password: Password.pure(),
            status: FormzStatus.pure)) {
    on<SignInEmailChanged>(_onEmailChanged);
    on<SignInPasswordChanged>(_onPasswordChanged);
    on<SignInSubmitted>(_onSubmitted);
  }

  FutureOr<void> _onEmailChanged(
      SignInEmailChanged event, Emitter<SignInState> emit) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([email, state.password]),
    ));
  }

  FutureOr<void> _onPasswordChanged(
      SignInPasswordChanged event, Emitter<SignInState> emit) {
    final password = Password.dirty(event.password);

    emit(state.copyWith(
        password: password, status: Formz.validate([state.email, password])));
  }

  FutureOr<void> _onSubmitted(
      SignInSubmitted event, Emitter<SignInState> emit) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final either = await _authenticationRepository.signin(
        Account(email: state.email.value, password: state.password.value));
    either.fold(
      ifLeft: (err) => emit(state.copyWith(
          status: FormzStatus.submissionFailure, errorMessage: err.toString())),
      ifRight: (user) =>
          emit(state.copyWith(status: FormzStatus.submissionSuccess, user: user)),
    );
  }
}

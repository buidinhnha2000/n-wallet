import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:formz/formz.dart';

// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import '../../../../common/base_state.dart';
import '../../../../di/service_locator.dart';
import '../../../../domain/repositories/authentication_repository.dart';
import '../../../../models/dtos/validator/validator.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(this._authenticationRepository) : super(const SignInState()) {
    on<SignInEmailChanged>(_onUsernameChanged);
    on<SignInPasswordChanged>(_onPasswordChanged);
    on<SignInSubmitted>(_onSubmitted);
    // on<SignInFacebookEvent>(_onFacebook);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onUsernameChanged(
    SignInEmailChanged event,
    Emitter<SignInState> emit,
  ) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([state.password, email]),
      ),
    );
  }

  void _onPasswordChanged(
    SignInPasswordChanged event,
    Emitter<SignInState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([password, state.email]),
      ),
    );
  }

  Future<void> _onSubmitted(
    SignInSubmitted event,
    Emitter<SignInState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final either = await _authenticationRepository.login(state.email.value, state.password.value);
      either.fold(
        ifLeft: (err) =>  print(err),
        ifRight: (user) => print(user),
      );
    }
  }

// Future<void> _onFacebook(
//     SignInFacebookEvent event,
//     Emitter<SignInState> emit,
//     ) async {
//   final AccessToken accessToken =
//   (await FacebookAuth.instance.login()) as AccessToken;
//   await _authenticationRepository.loginWithFacebook(accessToken.token);
// }
}

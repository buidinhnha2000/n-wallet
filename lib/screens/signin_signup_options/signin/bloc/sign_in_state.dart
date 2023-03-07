part of 'sign_in_bloc.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    required Email email,
    required Password password,
    required FormzStatus status,
    String? errorMessage,
    User? user,
  }) = _SignInState;
}



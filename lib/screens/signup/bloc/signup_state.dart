part of 'signup_bloc.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    required Email email,
    required Name name,
    required Password password,
    required FormzStatus status,
    String? errorMessage,
    User? user,
  }) = _SignUpState;
}

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../common/error.dart';
import '../../domain/domain.dart';
import '../../models/models.dart';

part 'social_authentication_state.dart';

class SocialAuthenticationCubit extends Cubit<SocialAuthenticationState> {
  SocialAuthenticationCubit(this._authenticationRepository)
      : super(SocialAuthenticationInitial());

  final AuthenticationRepository _authenticationRepository;

  Future<String?> signinWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    late final OAuthCredential credential;
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      await FirebaseAuth.instance.signInWithCredential(credential);
    }
    return credential.idToken;
  }

  FutureOr<void> onSubmitted() async {
    final idToken = await signinWithGoogle();
    final either = await _authenticationRepository.signinWithGoogle(idToken);
    either.fold(ifLeft: (error) {
      emit(SocialAuthenticationNotLogged(error));
    }, ifRight: (user) {
      if (user == null) {
        return emit(SocialAuthenticationError('An error occurred'));
      }
      emit(SocialAuthenticationLogged(user));
    });
  }
}

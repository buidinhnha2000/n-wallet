import 'view/signin_button.dart';
import 'view/signin_email_input.dart';
import 'view/signin_password_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../../common/assets/app_assets.dart';
import '../../../domain/repositories/authentication_repository.dart';
import '../../../l10n/l10n.dart';
import '../../../navigation/navigation.dart';
import 'bloc/sign_in_bloc.dart';
import 'view/signin_bottom.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocProvider(
          create: (context) {
            return SignInBloc(
                RepositoryProvider.of<AuthenticationRepository>(context));
          },
          child: Stack(
            children: [_topPage(), const SignInScreenBottom()],
          ),
        ),
      ),
    );
  }

  Widget _topPage() {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text(context.l10n.text_authentication_failure)));
        }
        if (state.status.isSubmissionSuccess) {
          Navigator.of(context).pushNamed(AppRoutes.signOption);
        }
      },
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 73,
            ),
            child: const Image(
              image: AssetImage(AppAssets.logoApp),
              height: 120,
              width: 164,
              fit: BoxFit.scaleDown,
            ),
          ),
          const EmailInput(),
          const PasswordInput(),
          const LoginButton(),
        ],
      ),
    );
  }
}

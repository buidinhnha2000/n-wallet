import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/assets/app_assets.dart';
import '../../../common/extensions/context.dart';
import '../../../common/widgets/widgets.dart';
import '../../../domain/repositories/authentication_repository.dart';
import '../../../l10n/l10n.dart';
import '../../../navigation/navigation.dart';
import '../../../theme/app_color.dart';
import 'bloc/sign_in_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  bool showPassword = false;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: BlocProvider(
        create: (context) {
          return SignInBloc(
            authenticationRepository:
            RepositoryProvider.of<AuthenticationRepository>(context),
          );
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [_topPage(), _bottomPage()],
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
            ..showSnackBar(
                const SnackBar(content: Text('Authentication Failure')));
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
          const SizedBox(
            height: 53,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: BlocBuilder<SignInBloc, SignInState>(
              buildWhen: (previous, current) => previous.email != current.email,
              builder: (context, state) {
                return TextForm(
                  hintText: context.l10n.text_yourEmail,
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  onChanged: (email) =>
                      context.read<SignInBloc>().add(SignInEmailChanged(email)),
                );
              },
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: BlocBuilder<SignInBloc, SignInState>(
              buildWhen: (previous, current) =>
              previous.password != current.password,
              builder: (context, state) {
                return TextForm(
                  hintText: context.l10n.text_password,
                  keyboardType: TextInputType.text,
                  controller: _passwordController,
                  isPassword: !showPassword,
                  suffixIcon: IconShowPassword(
                    showPassword: showPassword,
                    onPressed: () =>
                        setState(() {
                          showPassword = !showPassword;
                        }),
                  ),
                  onChanged: (password) =>
                      context.read<SignInBloc>().add(
                          SignInEmailChanged(password)),
                );
              },
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    context.l10n.text_signIn_forgot,
                    style: context.textTheme.bodyLarge?.copyWith(
                        color: AppColors.primaryGreen,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) {
                    return state.status.isSubmissionInProgress
                        ? const CircularProgressIndicator()
                        : DWalletButton(
                      onPressed: state.status.isValidated
                          ? () {
                        context
                            .read<SignInBloc>()
                            .add(SignInSubmitted());
                      }
                          : null,
                      text: context.l10n.text_login,
                      color: AppColors.buttonNeonGreen,
                      buttonType: ButtonType.onlyText,
                    );
                  },
                ),

              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.l10n.text_signIn_new_to_DPay,
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: AppColors.textLightBlack,
                    ),
                  ),
                  GestureDetector(
                    // onTap: () {Navigator.of(context).pushNamed(AppRoutes.signUp);},
                    child: Text(
                      context.l10n.text_signUp,
                      style: context.textTheme.bodyLarge?.copyWith(
                          color: AppColors.primaryGreen,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryGreen),
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 150,
          ),
        ],
      ),
    );
  }

  Widget _bottomPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          context.l10n.text_signIn_option_auth,
          style: context.textTheme.bodyLarge?.copyWith(
            color: AppColors.textLightBlack,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          height: 54,
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: DWalletButton(
                    onPressed: () {
                      return Navigator.of(context).pushNamed(AppRoutes.signIn);
                    },
                    text: context.l10n.text_facebook,
                    color: null,
                    imageIcon: AppAssets.iconFacebook,
                    buttonType: ButtonType.iconAndText),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                flex: 1,
                child: DWalletButton(
                  onPressed: () {
                    return Navigator.of(context).pushNamed(AppRoutes.signIn);
                  },
                  text: context.l10n.text_google,
                  color: null,
                  imageIcon: AppAssets.iconGoogle,
                  buttonType: ButtonType.iconAndText,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 32,
        )
      ],
    );
  }
}

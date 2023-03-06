import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../common/assets/app_assets.dart';
import '../../../common/extensions/context.dart';
import '../../../common/widgets/widgets.dart';
import '../../../l10n/l10n.dart';
import '../../../navigation/navigation.dart';
import '../../../theme/app_color.dart';
import '../bloc/signup_bloc.dart';
import '../validation/validations.dart';

class SignUpEmailStep extends StatefulWidget {
  const SignUpEmailStep({
    super.key,
  });

  @override
  State<SignUpEmailStep> createState() => _SignUpEmailStepState();
}

class _SignUpEmailStepState extends State<SignUpEmailStep> {
  late final TextEditingController _textEmailController;

  @override
  void initState() {
    _textEmailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEmailController.dispose();
    super.dispose();
  }

  String? handleShowError(Email emailError) {
    if (emailError.pure || emailError.valid) {
      return '';
    }
    if (emailError.value.isEmpty) {
      return context.l10n.text_complete_all_info;
    }
    return context.l10n.text_email_invalidate;
  }

  void handleNavigationToNameStep(FormzInputStatus emailStatus) {
    if (emailStatus == FormzInputStatus.valid) {
      context.navigator.pushNamed(AppRoutes.signUpNameStep);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<SignUpBloc, SignUpState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      margin: const EdgeInsets.only(bottom: 60.0),
                      child: Image.asset(AppAssets.logoApp),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DWalletTextField(
                          controller: _textEmailController,
                          hintText: context.l10n.text_yourEmail,
                          onChanged: (emailValue) {
                            context
                                .read<SignUpBloc>()
                                .add(EmailChanged(email: emailValue));
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          handleShowError(state.email).toString(),
                          style: context.textTheme.titleSmall?.copyWith(
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 14.0,
                    ),
                    Text(
                      context.l10n.text_desc_create_account,
                      style: context.textTheme.titleSmall?.copyWith(
                          color: Colors.black54,
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 26.0),
                      child: DWalletButton(
                          onPressed: () {
                            handleNavigationToNameStep(state.email.status);
                          },
                          text: context.l10n.text_continue,
                          color: AppColors.buttonNeonGreen,
                          buttonType: ButtonType.onlyText),
                    ),
                    _TextNavigateToLoginWidget(),
                    const Spacer(),
                    _ButtonsSocialWidget()
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _ButtonsSocialWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DWalletButton(
          onPressed: () {
            context.navigator.pushNamed(AppRoutes.signUpNameStep);
          },
          buttonType: ButtonType.iconAndText,
          text: context.l10n.text_sign_up_with_facebook,
          imageIcon: AppAssets.iconFacebook,
        ),
        const SizedBox(
          height: 12.0,
        ),
        DWalletButton(
          onPressed: () {
            context.navigator.pushNamedAndRemoveUntil(
                AppRoutes.signUpNameStep, (route) => false);
          },
          buttonType: ButtonType.iconAndText,
          text: context.l10n.text_sign_up_with_google,
          imageIcon: AppAssets.iconGoogle,
        ),
      ],
    );
  }
}

class _TextNavigateToLoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          context.l10n.text_have_an_account,
          style: context.textTheme.titleSmall?.copyWith(
              color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300),
        ),
        TextButton(
          onPressed: () {
            context.navigator.pushNamed(AppRoutes.signUpNameStep);
          },
          child: Text(
            context.l10n.text_login,
            style: context.textTheme.titleSmall?.copyWith(
              color: AppColors.primaryGreen,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primaryGreen,
            ),
          ),
        ),
      ],
    );
  }
}

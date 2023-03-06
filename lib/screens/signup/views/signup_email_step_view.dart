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

  void handleNavigationToNameStep(
      FormzInputStatus emailStatus, String? errorMessage) {
    (emailStatus == FormzInputStatus.valid && errorMessage != null)
        ? context.read<SignUpBloc>().add(SignupEmailExists())
        : context.navigator.pushNamed(AppRoutes.signUpNameStep);
  }

  String? handleShowStatusError(Email emailStatus, String? errorMessage) {
    if (errorMessage == 'true') {
      return 'mail đã tồn tại';
    }
    if (emailStatus.pure || emailStatus.valid) {
      return '';
    }
    if (emailStatus.value.isEmpty) {
      return context.l10n.text_complete_all_info;
    }
    return context.l10n.text_email_invalidate;
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
                    const _LogoHeaderWidget(),
                    _TextFormFieldWithValidationWidget(
                      controller: _textEmailController,
                      textError:
                          handleShowStatusError(state.email, state.errorMessage)
                              .toString(),
                    ),
                    _DescriptionTermsWidget(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 26.0),
                      child: DWalletButton(
                          onPressed: () {
                            handleNavigationToNameStep(
                                state.email.status, state.errorMessage);
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

class _LogoHeaderWidget extends StatelessWidget {
  const _LogoHeaderWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      margin: const EdgeInsets.only(bottom: 60.0),
      child: Image.asset(AppAssets.logoApp),
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

class _TextFormFieldWithValidationWidget extends StatelessWidget {
  final TextEditingController controller;
  final String textError;

  const _TextFormFieldWithValidationWidget({
    required this.controller,
    required this.textError,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DWalletTextField(
          controller: controller,
          hintText: context.l10n.text_yourEmail,
          onChanged: (emailValue) {
            context.read<SignUpBloc>().add(EmailChanged(email: emailValue));
          },
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Text(
            textError,
            style: context.textTheme.titleSmall?.copyWith(
              color: Colors.red,
            ),
          ),
        )
      ],
    );
  }
}

class _DescriptionTermsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      context.l10n.text_desc_create_account,
      style: context.textTheme.titleSmall?.copyWith(
          color: AppColors.textLightBlack,
          fontSize: 15,
          fontWeight: FontWeight.w300),
    );
  }
}

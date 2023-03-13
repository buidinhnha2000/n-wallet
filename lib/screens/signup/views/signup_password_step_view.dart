import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../blocs/authentication/authentication_cubit.dart';
import '../../../common/assets/app_assets.dart';
import '../../../common/extensions/extensions.dart';
import '../../../common/widgets/widgets.dart';
import '../../../l10n/l10n.dart';
import '../../../navigation/navigation.dart';
import '../../../theme/app_color.dart';
import '../bloc/signup_bloc.dart';
import '../validation/validations.dart';

class ValidationItem {
  bool isValid;
  final String text;
  final PasswordValidationError error;

  ValidationItem(this.isValid, this.text, this.error);
}

class SignUpPasswordStep extends StatelessWidget {
  const SignUpPasswordStep({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<ValidationItem> passwordValidationList = [
      ValidationItem(false, context.l10n.text_least_one_upper_case,
          PasswordValidationError.oneUpperCase),
      ValidationItem(false, context.l10n.text_least_one_lower_case,
          PasswordValidationError.oneLowerCase),
      ValidationItem(false, context.l10n.text_none_vietnamese,
          PasswordValidationError.noneVietnamese),
      ValidationItem(false, context.l10n.text_least_one_digit,
          PasswordValidationError.oneDigit),
      ValidationItem(false, context.l10n.text_least_one_special_character,
          PasswordValidationError.oneSpecialCharacter),
      ValidationItem(false, context.l10n.text_minimum_eight_in_length,
          PasswordValidationError.minimumEightLength)
    ];

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: BlocBuilder<SignUpBloc, SignUpState>(
          builder: (context, state) {
            return Stack(
              children: [
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _TitlePasswordWidget(),
                        _DescriptionPasswordWidget(),
                        _TextFormInputPasswordWidget(),
                        _ListValidationPasswordWidget(
                          validationList: passwordValidationList,
                        ),
                        const Spacer(),
                        BlocConsumer<SignUpBloc, SignUpState>(
                          listener: (context, state) {
                            if (state.user != null) {
                              context
                                  .read<AuthenticationCubit>()
                                  .setUserLogged(state.user);
                            }
                            if (state.status.isSubmissionSuccess) {
                              context.navigator.pushNamedAndRemoveUntil(
                                  AppRoutes.welcome, (route) => false);
                            }
                          },
                          builder: (context, state) {
                            return DWalletButton(
                                onPressed: () {
                                  if (state.status.isValidated) {
                                    context
                                        .read<SignUpBloc>()
                                        .add(SignupSubmitted());
                                  }
                                },
                                text: context.l10n.text_continue,
                                color: AppColors.buttonNeonGreen,
                                buttonType: ButtonType.onlyText);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                if (state.status.isSubmissionInProgress ||
                    state.status.isSubmissionFailure)
                  const DWalletLoader()
              ],
            );
          },
        ),
      ),
    );
  }
}

class _TitlePasswordWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 0,
          child: DWalletButton(
              onPressed: () {
                context
                    .read<SignUpBloc>()
                    .add(const PasswordChanged(password: ''));
                context.navigator.pop();
              },
              color: Colors.white,
              buttonType: ButtonType.onlyIcon,
              imageIcon: AppAssets.iconBack),
        ),
        const Spacer(),
        Expanded(
            flex: 7,
            child: Text(
              context.l10n.text_new_password,
              style: context.textTheme.titleSmall?.copyWith(
                  color: AppColors.textBlackLight,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ))
      ],
    );
  }
}

class _TextFormInputPasswordWidget extends StatefulWidget {
  @override
  State<_TextFormInputPasswordWidget> createState() =>
      _TextFormInputPasswordWidgetState();
}

class _TextFormInputPasswordWidgetState
    extends State<_TextFormInputPasswordWidget> {
  late final TextEditingController _textPasswordController;
  bool showPassword = false;

  @override
  void initState() {
    _textPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.text_password,
          style: context.textTheme.titleSmall?.copyWith(
              color: AppColors.textLightBlack, fontWeight: FontWeight.w400),
        ),
        DWalletTextField(
          keyboardType: TextInputType.text,
          controller: _textPasswordController,
          isPassword: !showPassword,
          onChanged: (passwordValue) {
            context
                .read<SignUpBloc>()
                .add(PasswordChanged(password: passwordValue));
          },
          suffixIcon: DWalletIconPassword(
            showPassword: showPassword,
            onPressed: () => setState(() {
              showPassword = !showPassword;
            }),
          ),
        ),
      ],
    );
  }
}

class _ListValidationPasswordWidget extends StatelessWidget {
  final List<ValidationItem> validationList;

  const _ListValidationPasswordWidget({required this.validationList});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        for (var e in validationList) {
          (e.isValid = state.password.error?.contains(e.error) ?? false);
        }
        return Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: validationList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: _ValidationItemWidget(
                        index: index,
                        errorPasswordList: state.password.error,
                        validationList: validationList,
                      ),
                    );
                  }),
            ],
          ),
        );
      },
    );
  }
}

class _ValidationItemWidget extends StatelessWidget {
  final List<ValidationItem> validationList;
  final List<PasswordValidationError>? errorPasswordList;
  final int index;

  const _ValidationItemWidget(
      {required this.validationList,
      required this.errorPasswordList,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: (errorPasswordList?.contains(validationList[index].error) ??
                    false)
                ? Colors.white
                : Colors.green,
            border: (errorPasswordList?.contains(validationList[index].error) ??
                    false)
                ? Border.all(color: AppColors.textLightBlack)
                : Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Center(
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 12,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          validationList[index].text.toString(),
          style: context.textTheme.titleSmall?.copyWith(
              color: AppColors.textLightBlack, fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}

class _DescriptionPasswordWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        context.l10n.text_new_password_content,
        style: context.textTheme.titleSmall?.copyWith(
            color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300),
      ),
    );
  }
}

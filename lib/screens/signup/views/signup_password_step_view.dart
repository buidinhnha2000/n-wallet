import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/assets/app_assets.dart';
import '../../../common/extensions/extensions.dart';
import '../../../common/widgets/widgets.dart';
import '../../../l10n/l10n.dart';
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
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _TitlePasswordWidget(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    context.l10n.text_new_password_content,
                    style: context.textTheme.titleSmall?.copyWith(
                        color: Colors.black54,
                        fontSize: 15,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                _TextFormInputPasswordWidget(),
                const Spacer(),
                BlocBuilder<SignUpBloc, SignUpState>(
                  builder: (context, state) {
                    return DWalletButton(
                        onPressed: () {
                          context.read<SignUpBloc>().add(SignupSubmitted());
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
                context.navigator.pop(context);
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
                  color: Colors.black,
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
    final List<ValidationItem> passwordValidationList = [
      ValidationItem(false, context.l10n.text_least_one_upper_case,
          PasswordValidationError.oneUpperCase),
      ValidationItem(false, context.l10n.text_least_one_lower_case,
          PasswordValidationError.oneLowerCase),
      ValidationItem(false, context.l10n.text_least_one_digit,
          PasswordValidationError.oneDigit),
      ValidationItem(false, context.l10n.text_least_one_special_character,
          PasswordValidationError.oneSpecialCharacter),
      ValidationItem(false, context.l10n.text_minimum_eight_in_length,
          PasswordValidationError.minimumEightLength)
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.text_password,
          style: context.textTheme.titleSmall
              ?.copyWith(color: Colors.black54, fontWeight: FontWeight.w400),
        ),
        BlocBuilder<SignUpBloc, SignUpState>(
          builder: (context, state) {
            for (var e in passwordValidationList) {
              (e.isValid = state.password.error?.contains(e.error) ?? false);
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
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
                const SizedBox(
                  height: 4,
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: passwordValidationList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                color: (state.password.error?.contains(
                                            passwordValidationList[index]
                                                .error) ??
                                        false)
                                    ? Colors.white
                                    : Colors.green,
                                border: (state.password.error?.contains(
                                            passwordValidationList[index]
                                                .error) ??
                                        false)
                                    ? Border.all(color: Colors.grey.shade400)
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
                              passwordValidationList[index].text.toString(),
                              style: context.textTheme.titleSmall
                                  ?.copyWith(color: Colors.black54),
                            ),
                          ],
                        ),
                      );
                    }),
              ],
            );
          },
        ),
      ],
    );
  }
}

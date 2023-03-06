import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/extensions/context.dart';
import '../../../../common/widgets/form_text/d_wallet_icon_password.dart';
import '../../../../common/widgets/form_text/d_wallet_text_field.dart';
import '../../../../l10n/l10n.dart';
import '../../../../theme/app_color.dart';
import '../bloc/sign_in_bloc.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({Key? key}) : super(key: key);

  @override
  State<PasswordInput> createState() => PasswordInputState();
}

class PasswordInputState extends State<PasswordInput> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 15),
      child: BlocBuilder<SignInBloc, SignInState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) {
          return Column(
            children: [
              DWalletTextField(
                  hintText: context.l10n.text_password,
                  keyboardType: TextInputType.text,
                  isPassword: !showPassword,
                  suffixIcon: DWalletIconPassword(
                    showPassword: showPassword,
                    onPressed: () => setState(() {
                      showPassword = !showPassword;
                    }),
                  ),
                  onChanged: (password) => context
                      .read<SignInBloc>()
                      .add(SignInPasswordChanged(password))),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    state.password.invalid
                        ? context.l10n.text_validator_password_error
                        : '',
                    style: context.textTheme.bodySmall
                        ?.copyWith(color: AppColors.textLightBlack, fontSize: 13),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

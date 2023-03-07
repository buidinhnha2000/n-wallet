import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/extensions/context.dart';
import '../../../../common/widgets/form_text/d_wallet_text_field.dart';
import '../../../../l10n/l10n.dart';
import '../../../../theme/app_color.dart';
import '../bloc/sign_in_bloc.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 53),
      child: BlocBuilder<SignInBloc, SignInState>(
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (context, state) {
          return Column(
            children: [
              DWalletTextField(
                hintText: context.l10n.text_yourEmail,
                keyboardType: TextInputType.emailAddress,
                onChanged: (email) {
                  context
                      .read<SignInBloc>()
                      .add(SignInEmailChanged(email));
                },
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    state.email.invalid ? context.l10n.text_validator_email_error : '',
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
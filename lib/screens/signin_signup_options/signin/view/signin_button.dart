import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../blocs/authentication/authentication_cubit.dart';
import '../../../../common/extensions/context.dart';
import '../../../../common/widgets/d_wallet_button.dart';
import '../../../../l10n/l10n.dart';
import '../../../../theme/app_color.dart';
import '../bloc/sign_in_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
              child: BlocConsumer<SignInBloc, SignInState>(
                listener: (context, state) {
                  if (state.user != null) {
                    context
                        .read<AuthenticationCubit>()
                        .setAccessToken(state.user?.accessToken ?? '');
                    context
                        .read<AuthenticationCubit>()
                        .setRefreshToken(state.user?.refreshToken ?? '');
                  }
                },
                builder: (context, state) {
                  debugPrint(state.toString());
                  return DWalletButton(
                    onPressed: state.status.isValidated
                        ? () {
                            context.read<SignInBloc>().add(SignInSubmitted());
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                          }
                        : () {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                          },
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
                const SizedBox(
                  width: 2,
                ),
                GestureDetector(
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
      ],
    );
  }
}

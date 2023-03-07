import 'package:flutter/cupertino.dart';
import '../../../../common/assets/app_assets.dart';
import '../../../../common/extensions/context.dart';
import '../../../../common/widgets/d_wallet_button.dart';
import '../../../../l10n/l10n.dart';
import '../../../../navigation/navigation.dart';
import '../../../../theme/app_color.dart';

class SignInScreenBottom extends StatelessWidget {
  const SignInScreenBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

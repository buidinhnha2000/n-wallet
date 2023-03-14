import 'package:flutter/material.dart';

import '../../common/assets/app_assets.dart';
import '../../common/extensions/extensions.dart';
import '../../common/widgets/d_wallet_button.dart';
import '../../l10n/l10n.dart';
import '../../navigation/navigation.dart';
import '../../theme/app_color.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryGreen,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                flex: 7,
                child: Center(child: Image.asset(AppAssets.imageWelcome))),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      context.l10n.text_welcome_title,
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleLarge?.copyWith(
                          fontSize: 28,
                          color: AppColors.textWhite,
                          fontWeight: FontWeight.w700),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 40),
                      child: Text(
                        textAlign: TextAlign.center,
                        context.l10n.text_welcome_desc,
                        style: context.textTheme.titleMedium?.copyWith(
                            color: AppColors.textLightBlack,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    DWalletButton(
                        onPressed: () {
                          context.navigator.pushNamedAndRemoveUntil(
                              AppRoutes.home, (route) => false);
                        },
                        color: AppColors.primaryNeonGreen,
                        text: context.l10n.text_get_started,
                        buttonType: ButtonType.onlyText),
                    const SizedBox(
                      height: 32,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

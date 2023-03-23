import 'package:flutter/material.dart';

import '../../../../common/assets/app_assets.dart';
import '../../../../common/extensions/extensions.dart';
import '../../../../common/widgets/d_wallet_button.dart';
import '../../../../common/widgets/d_wallet_credit_card.dart';
import '../../../../l10n/l10n.dart';
import '../../../../navigation/navigation.dart';
import '../../../../theme/app_color.dart';

class DepositAddCreditCardSuccess extends StatelessWidget {
  const DepositAddCreditCardSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.backgroundGreen,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
                child: _Header(),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              margin: const EdgeInsets.only(top: 16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 16),
                      child: Text(
                        context.l10n.text_card_settings,
                        style: context.textTheme.titleMedium?.copyWith(
                            color: AppColors.textBlack,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Spacer(),
                    DWalletButton(
                      onPressed: () {
                        context.navigator
                            .pushNamed(AppRoutes.depositWithCreditCard);
                      },
                      color: AppColors.primaryNeonGreen,
                      text: context.l10n.text_deposit_now,
                      buttonType: ButtonType.onlyText,
                    ),
                    const SizedBox(
                      height: 32,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25, left: 16, right: 16),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DWalletButton(
                  onPressed: () {
                    context.navigator
                        .pushNamed(AppRoutes.depositWithCreditCard);
                  },
                  color: AppColors.primaryOrange,
                  imageIcon: AppAssets.iconAdd,
                  buttonType: ButtonType.onlyIcon)
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 24),
            child: DWalletCreditCard(
              cardBackground: AppColors.primaryOrange,
            ),
          ),
        ],
      ),
    );
  }
}

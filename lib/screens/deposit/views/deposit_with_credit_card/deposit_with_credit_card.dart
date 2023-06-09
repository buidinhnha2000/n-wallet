import 'package:flutter/material.dart';

import '../../../../common/assets/app_assets.dart';
import '../../../../common/extensions/extensions.dart';
import '../../../../common/widgets/card/card.dart';
import '../../../../common/widgets/widgets.dart';
import '../../../../l10n/l10n.dart';
import '../../../../navigation/navigation.dart';
import '../../../../theme/app_color.dart';

class DepositWithCreditCard extends StatelessWidget {
  const DepositWithCreditCard({Key? key}) : super(key: key);

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
              child: const _DepositContent(),
            ),
          )
        ],
      ),
    );
  }
}

class _DepositContent extends StatelessWidget {
  const _DepositContent();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          DWalletButton(
              onPressed: () {},
              text: context.l10n.text_deposit_now,
              color: AppColors.primaryNeonGreen,
              style: context.textTheme.titleMedium
                  ?.copyWith(color: AppColors.textWhite),
              buttonType: ButtonType.onlyText),
          DWalletButton(
              onPressed: () {
                context.navigator.pushNamed(AppRoutes.home);
              },
              text: context.l10n.text_back_to_home,
              style: context.textTheme.titleMedium
                  ?.copyWith(color: AppColors.iconGrey),
              buttonType: ButtonType.onlyText),
          const SizedBox(
            height: 32,
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
          DWalletAppBar(
            text: context.l10n.text_title_deposit_with_credit_card,
            textColor: AppColors.textWhite,
            buttonColor: Colors.transparent,
            icon: AppAssets.iconBackWhite,
            onPressed: () {
              context.navigator.pop();
            },
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(context.l10n.text_credit_card,
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      )),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(context.l10n.text_choose_your_credit_card,
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w200,
                        fontSize: 16,
                      )),
                ],
              ),
              DWalletButton(
                  onPressed: () {
                    context.navigator.pushNamed(AppRoutes.depositNewCreditCard);
                  },
                  color: AppColors.primaryOrange,
                  imageIcon: AppAssets.iconAdd,
                  buttonType: ButtonType.onlyIcon)
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 24),
            child: DWalletCard(
              cardBackground: AppColors.primaryNeonGreen,
              money: 26.968,
              numberCard: '37435353564335',
            ),
          ),
        ],
      ),
    );
  }
}

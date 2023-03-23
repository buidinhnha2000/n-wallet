import 'package:flutter/material.dart';

import '../../../common/widgets/card/card.dart';
import '../../../l10n/l10n.dart';
import '../../../theme/app_color.dart';

class ProfileScreenCard extends StatelessWidget {
  const ProfileScreenCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 56, right: 56),
          height: 16,
          decoration: const BoxDecoration(
              color: AppColors.cardBackgroundGreen,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        ),
        Container(
          margin: const EdgeInsets.only(left: 40, right: 40),
          height: 16,
          decoration: const BoxDecoration(
              color: AppColors.cardBackgroundSalmon,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        ),
        DWalletCard(
          numberCard: '1111222233334444',
          money: 12361273,
          cardBackground: AppColors.cardBackgroundNeonGreen,
          text: context.l10n.text_balance,
          cardExpiration: '11/24',
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../../../common/assets/app_assets.dart';
import '../../../common/extensions/context.dart';
import '../../../common/widgets/d_wallet_button.dart';
import '../../../l10n/l10n.dart';
import '../../../theme/app_color.dart';

class ProfileScreenHeader extends StatelessWidget {
  const ProfileScreenHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: const EdgeInsets.only(top: 61, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(context.l10n.text_my_profile,
              style: context.textTheme.bodySmall?.copyWith(
                  color: AppColors.textWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.w700)),
          DWalletButton(
            onPressed: () {},
            buttonType: ButtonType.onlyIcon,
            imageIcon: AppAssets.iconQr1,
            color: AppColors.backgroundGreen,
          ),
        ],
      ),
    );
  }
}

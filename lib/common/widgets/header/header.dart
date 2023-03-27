import 'package:flutter/cupertino.dart';

import '../../../theme/app_color.dart';
import '../../assets/app_assets.dart';
import '../../extensions/context.dart';
import '../d_wallet_button.dart';

class HeaderScreen extends StatelessWidget {
  const HeaderScreen({
    Key? key,
    this.title,
    this.iconRight,
    this.iconLeft,
    this.onTab,
    this.icon,
  }) : super(key: key);
  final String? title;
  final bool? iconRight;
  final bool? iconLeft;
  final String? onTab;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          iconLeft != false
              ? DWalletButton(
                  onPressed: () {
                    context.navigator.pop();
                  },
                  buttonType: ButtonType.onlyIcon,
                  imageIcon: AppAssets.iconBackWhite,
                  color: AppColors.backgroundGreen,
                )
              : const SizedBox(
                  width: 48,
                ),
          Text(
            title ?? '',
            style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.textWhite,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
          iconRight != false
              ? DWalletButton(
                  onPressed: () {
                    return context.navigator.pushNamed(onTab ?? '');
                  },
                  buttonType: ButtonType.onlyIcon,
                  imageIcon: icon ?? AppAssets.iconSearch,
                  color: AppColors.backgroundGreen,
                )
              : const SizedBox(
                  width: 48,
                ),
        ],
      ),
    );
  }
}

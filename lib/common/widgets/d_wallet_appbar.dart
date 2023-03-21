import 'package:flutter/material.dart';

import '../../theme/app_color.dart';
import '../assets/app_assets.dart';
import '../extensions/extensions.dart';
import 'widgets.dart';

class DWalletAppBar extends StatelessWidget {
  const DWalletAppBar(
      {super.key,
      required this.text,
      this.onPressed,
      this.textColor,
      this.buttonColor,
      this.icon});

  final String text;
  final Color? textColor;
  final Color? buttonColor;
  final Function()? onPressed;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 0,
          child: DWalletButton(
              onPressed: () {
                onPressed?.call();
              },
              color: buttonColor ?? Colors.white,
              buttonType: ButtonType.onlyIcon,
              imageIcon: icon ?? AppAssets.iconBack),
        ),
        const SizedBox(
          width: 35,
        ),
        Expanded(
            flex: 4,
            child: Text(
              text,
              style: context.textTheme.titleSmall?.copyWith(
                  color: textColor ?? AppColors.textBlackLight,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ))
      ],
    );
  }
}

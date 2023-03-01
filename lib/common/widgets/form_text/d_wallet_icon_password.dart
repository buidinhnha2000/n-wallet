import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../common/assets/app_assets.dart';

class DWalletIconPassword extends StatelessWidget {
  const DWalletIconPassword({
    Key? key,
    required this.showPassword,
    required this.onPressed,
  }) : super(key: key);
  final bool showPassword;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        showPassword ? AppAssets.iconPasswordShow : AppAssets.iconPasswordLess,
        height: 24,
        width: 24,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}

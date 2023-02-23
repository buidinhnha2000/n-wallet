import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/assets/app_assets.dart';

class IconShowPassword extends StatefulWidget {
  const IconShowPassword({Key? key}) : super(key: key);

  @override
  State<IconShowPassword> createState() => _IconShowPasswordState();
}

class _IconShowPasswordState extends State<IconShowPassword> {
  late bool iconShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(() {
          iconShowPassword = ! iconShowPassword;
        });
      },
      child: SvgPicture.asset(
        iconShowPassword ? AppAssets.iconTea : AppAssets.iconPasswordLess,
        height: 24,
        width: 24,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}

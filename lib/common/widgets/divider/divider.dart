import 'package:flutter/material.dart';

import '../../../theme/app_color.dart';

class DividerDWallet extends StatelessWidget {
  const DividerDWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 5,
          width: 48,
          decoration: const BoxDecoration(
              color: AppColors.dividerBlackLight,
              borderRadius: BorderRadius.all(
                  Radius.circular(100))),
        )
      ],
    );
  }
}

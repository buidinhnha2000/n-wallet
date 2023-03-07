import 'package:flutter/material.dart';

import '../../common/assets/app_assets.dart';
import '../../theme/app_color.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryGreen,
      body: SafeArea(
        child: Center(
          child: Image.asset(AppAssets.imageWelcome),
        ),
      ),
    );
  }
}

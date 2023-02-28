import 'package:flutter/material.dart';

import '../../common/assets/app_assets.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(AppAssets.logoApp),
            
          ],
        ),
      ),
    );
  }
}

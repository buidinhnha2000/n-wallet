import 'package:flutter/material.dart';

import '../../common/extensions/extensions.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            "Welcome Screen",
            style:
                context.textTheme.titleSmall?.copyWith(color: Colors.black54),
          ),
        ),
      ),
    );
  }
}

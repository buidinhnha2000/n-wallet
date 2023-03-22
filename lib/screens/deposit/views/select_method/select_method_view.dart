import 'package:flutter/material.dart';

import '../../../../common/extensions/context.dart';
import '../../../../common/widgets/d_wallet_button.dart';
import '../../../../navigation/navigation.dart';

class DepositSelectMethods extends StatelessWidget {
  const DepositSelectMethods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DWalletButton(
          onPressed: () {
            context.navigator.pushNamed(AppRoutes.depositWithCreditCard);
          },
          buttonType: ButtonType.onlyText,
          text: 'Go to deposit with credit card',
          color: Colors.teal,
        ),
      ),
    );
  }
}

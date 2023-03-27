import 'package:flutter/cupertino.dart';

import '../../../common/widgets/header/header.dart';
import '../../../l10n/l10n.dart';
import '../../../navigation/navigation.dart';

class TransferBalanceScreenHeader extends StatelessWidget {
  const TransferBalanceScreenHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.only(
            left: 16, right: 16, top: 60, bottom: 24),
        child: HeaderScreen(
            onTab: AppRoutes.search,
            iconLeft: true,
            iconRight: true,
            title: context.l10n.text_transfer_balance),
      ),
    );
  }
}

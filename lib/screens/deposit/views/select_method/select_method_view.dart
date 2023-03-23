import 'package:flutter/material.dart';

import '../../../../common/assets/app_assets.dart';
import '../../../../common/extensions/context.dart';
import '../../../../common/widgets/widgets.dart';
import '../../../../l10n/l10n.dart';
import '../../../../navigation/navigation.dart';
import '../../../../theme/app_color.dart';
import '../../utils/utils.dart';

class DepositSelectMethods extends StatelessWidget {
  const DepositSelectMethods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<DepositMethod> depositMethodList = [
      DepositMethod(
        suffixIcon: AppAssets.iconArrowForward,
        route: AppRoutes.depositWithCreditCard,
        prefixIcon: AppAssets.iconCreditCard,
        text: context.l10n.text_credit_card,
      ),
      DepositMethod(
          suffixIcon: AppAssets.iconArrowForward,
          route: AppRoutes.depositWithCreditCard,
          prefixIcon: AppAssets.iconBank,
          text: context.l10n.text_bank_transfer),
    ];
    return DWalletDepositAndTransferLayout(
      title: context.l10n.text_title_select_methods_deposit,
      desc: context.l10n.text_desc_select_methods_deposit,
      child: ListView.builder(
          itemCount: depositMethodList.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: _DepositMethodItem(
                depositMethodList: depositMethodList,
                index: index,
              ),
            );
          }),
    );
  }
}

class _DepositMethodItem extends StatelessWidget {
  const _DepositMethodItem({
    required this.depositMethodList,
    required this.index,
  });

  final List<DepositMethod> depositMethodList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.navigator.pushNamed(depositMethodList[index].route);
      },
      child: DWalletCardView(
        backgroundColor: AppColors.iconBackgroundWhile,
        prefixIcon: depositMethodList[index].prefixIcon,
        suffixIcon: depositMethodList[index].suffixIcon,
        style:
            context.textTheme.titleMedium?.copyWith(color: AppColors.textBlack),
        child: Text(
          depositMethodList[index].text,
          style: context.textTheme.bodySmall
              ?.copyWith(color: AppColors.textBlack, fontSize: 16),
        ),
      ),
    );
  }
}

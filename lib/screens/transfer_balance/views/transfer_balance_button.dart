import 'transfer_model.dart';
import 'package:flutter/material.dart';

import '../../../common/extensions/context.dart';
import '../../../common/widgets/d_wallet_button.dart';
import '../../../common/widgets/show_error.dart';
import '../../../l10n/l10n.dart';
import '../../../navigation/navigation.dart';
import '../../../theme/app_color.dart';

class TransferBalanceButton extends StatelessWidget {
  const TransferBalanceButton({Key? key, required this.transferModel})
      : super(key: key);
  final TransferModel transferModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),
              DWalletButton(
                onPressed: () {
                  print(transferModel.amount);
                  if ((transferModel.idUser != 0 &&
                      transferModel.amount != 0)) {
                    context.navigator.pushNamed(AppRoutes.transferConfirm,
                        arguments: TransferModel(
                            transferModel.idUser,
                            transferModel.amount,
                            transferModel.notes,
                            transferModel.name));
                  }
                  if (transferModel.idUser == 0 && transferModel.amount != 0) {
                    modalError(context, context.l10n.text_transfer_error_user,
                        onPressed: () {
                      context.navigator.pop(context);
                    });
                  }
                  if (transferModel.idUser != 0 && transferModel.amount == 0) {
                    modalError(context, context.l10n.text_transfer_error_amount,
                        onPressed: () {
                      context.navigator.pop(context);
                    });
                  }
                  if (transferModel.idUser == 0 && transferModel.amount == 0) {
                    modalError(
                        context, context.l10n.text_transfer_error_user_amount,
                        onPressed: () {
                      context.navigator.pop(context);
                    });
                  }
                },
                text: context.l10n.text_continue,
                color: AppColors.buttonNeonGreen,
                buttonType: ButtonType.onlyText,
              ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        )
      ],
    );
  }
}

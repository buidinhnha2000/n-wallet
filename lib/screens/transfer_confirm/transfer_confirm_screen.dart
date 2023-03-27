import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/widgets/header/header.dart';
import '../../../di/service_locator.dart';
import '../../../l10n/l10n.dart';
import '../../../theme/app_color.dart';
import '../transfer_balance/views/transfer_model.dart';
import 'views/transfer_confirm_choose_card.dart';
import 'views/transfer_confirm_user.dart';
import 'bloc/transfer_confirm_bloc.dart';

class TransferConfirmScreen extends StatelessWidget {
  const TransferConfirmScreen({Key? key, required this.transferModel})
      : super(key: key);
  final TransferModel transferModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TransferConfirmBloc(ServiceLocator.instance.inject()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundGreen,
        body: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 60),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                HeaderScreen(
                    iconLeft: true,
                    iconRight: false,
                    title: context.l10n.text_confirm_transfer),
                TransferConfirmScreenUser(
                  name: transferModel.name,
                  amount: transferModel.amount,
                  numberCard: '4242424242424242',
                ),
              ],
            ),
            TransferConfirmScreenChooseCard(
              transferModel: TransferModel(
                  transferModel.idUser,
                  transferModel.amount,
                  transferModel.notes,
                  transferModel.name,
              ),
              numberCard: '1234567812345678',
            )
          ],
        ),
      ),
    );
  }
}

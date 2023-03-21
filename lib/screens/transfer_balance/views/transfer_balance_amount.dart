import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/extensions/context.dart';
import '../../../../common/widgets/card/card_format.dart';
import '../../../../l10n/l10n.dart';
import '../../../../theme/app_color.dart';
import '../bloc/transfer_balance_bloc.dart';

class TransferBalanceScreenAmount extends StatelessWidget {
  const TransferBalanceScreenAmount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<TransferBalanceBloc, TransferBalanceState>(
      builder: (context, state) {
        return ListView(
          padding: const EdgeInsets.only(top: 24),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            Text(
              context.l10n.text_set_amount,
              style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.textBlack,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              context.l10n.text_how_much_transfer,
              style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.textLightBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<TransferBalanceBloc, TransferBalanceState>(
                  builder: (context, state) {
                    final amountDefault = dWalletFormatCard.currencyFormat
                        .format(0);
                    if(state.amount != null) {
                      double? amount1 = state.amount;
                      final amountTotal = dWalletFormatCard.currencyFormat
                          .format(amount1);
                      return Text(
                        amountTotal,
                        style: context.textTheme.bodyMedium?.copyWith(
                            color: AppColors.textBlack,
                            fontSize: 28,
                            fontWeight: FontWeight.w700),
                      );
                    }
                    return Text(
                      amountDefault,
                      style: context.textTheme.bodyMedium?.copyWith(
                          color: AppColors.textBlack,
                          fontSize: 28,
                          fontWeight: FontWeight.w700),
                    );
                  },
                ),
              ],
            ),
            const Divider(height: 1, color: AppColors.dividerBlackLight),
            const SizedBox(
              height: 16,
            ),
            const TransferBalanceAmountOption()
          ],
        );
      },
    );
  }
}

class TransferBalanceAmountOption extends StatelessWidget {
  const TransferBalanceAmountOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransferBalanceBloc, TransferBalanceState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 4, right: 4),
              height: 36,
              width: 89,
              child: ElevatedButton(
                onPressed: () {
                  double amount = 100;
                  context.read<TransferBalanceBloc>().add(OnChangedAmount(
                      amount));
                },
                style: const ButtonStyle(
                    elevation: MaterialStatePropertyAll(0),
                    backgroundColor:
                    MaterialStatePropertyAll(AppColors.buttonLightGreen)),
                child: Text(
                  dWalletFormatCard.currencyFormat.format(100),
                  style: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.textNeonGreen,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 4, right: 4),
              height: 36,
              width: 89,
              child: ElevatedButton(
                onPressed: () {
                  double amount = 250;
                  context.read<TransferBalanceBloc>().add(OnChangedAmount(
                      amount));
                },
                style: const ButtonStyle(
                    elevation: MaterialStatePropertyAll(0),
                    backgroundColor:
                    MaterialStatePropertyAll(AppColors.buttonLightGreen)),
                child: Text(
                  dWalletFormatCard.currencyFormat.format(250),
                  style: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.textNeonGreen,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 4, right: 4),
              height: 36,
              width: 89,
              child: ElevatedButton(
                onPressed: () {
                  double amount = 500;
                  context.read<TransferBalanceBloc>().add(OnChangedAmount(
                      amount));
                },
                style: const ButtonStyle(
                    elevation: MaterialStatePropertyAll(0),
                    backgroundColor:
                    MaterialStatePropertyAll(AppColors.buttonLightGreen)),
                child: Text(
                  dWalletFormatCard.currencyFormat.format(500),
                  style: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.textNeonGreen,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

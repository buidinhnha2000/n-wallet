import 'package:flutter/material.dart';
import '../../../../common/extensions/context.dart';
import '../../../../common/widgets/card/card_format.dart';
import '../../../../l10n/l10n.dart';
import '../../../../theme/app_color.dart';

class TransferBalanceScreenAmount extends StatefulWidget {
  const TransferBalanceScreenAmount({Key? key}) : super(key: key);

  @override
  State<TransferBalanceScreenAmount> createState() =>
      _TransferBalanceScreenAmountState();
}

class _TransferBalanceScreenAmountState extends State<TransferBalanceScreenAmount> {
  double a = 0.0;

  @override
  Widget build(BuildContext context) {
    final a1 = dWalletFormatCard.currencyFormat.format(a);
    final a2 = dWalletFormatCard.currencyFormat.format(0);
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
            InkWell(
              onTap: () {
                setState(() {});
              },
              child: Text(
                a == 0 ? a2 : a1,
                style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.textBlack,
                    fontSize: 28,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
        const Divider(height: 1, color: AppColors.dividerBlackLight),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 4, right: 4),
              height: 36,
              width: 89,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    a = 100;
                  });
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
                  setState(() {
                    a = 250;
                  });
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
                  setState(() {
                    a = 500;
                  });
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
        )
      ],
    );
  }
}
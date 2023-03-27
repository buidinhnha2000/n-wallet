import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../common/extensions/context.dart';
import '../../../../common/widgets/card/card_format.dart';
import '../../../../l10n/l10n.dart';
import '../../../../theme/app_color.dart';
import '../../transfer_confirm/bloc/transfer_confirm_bloc.dart';

class TransferBalanceScreenAmount extends StatelessWidget {
  const TransferBalanceScreenAmount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          const TransferBalanceAmountMoney(),
          const Divider(height: 1, color: AppColors.dividerBlackLight),
          const SizedBox(
            height: 16,
          ),
          const TransferBalanceAmountOption()
        ],
      ),
    );
  }
}

class TransferBalanceAmountMoney extends StatelessWidget {
  const TransferBalanceAmountMoney({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return BlocConsumer<TransferConfirmBloc, TransferConfirmState>(
      listener: (context, state) {
        controller.value = TextEditingValue(
            text: NumberFormat.currency(
              decimalDigits: 2,
              symbol: '',
            ).format(double.tryParse(state.amount.toString())),
            selection: controller.selection);
      },
      builder: (context, state) {
        return TextFormField(
          scrollPadding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 20*4),
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            CurrencyTextInputFormatter(symbol: ''),
          ],
          decoration: const InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.buttonBorder, width: 2)),
            enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.buttonBorder, width: 2)),
            prefixText: '\$',
          ),
          style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.textLightBlack,
              fontSize: 28,
              fontWeight: FontWeight.w700),
          onChanged: (value) {
            String output = value.replaceAll(',', '');
            var amount = double.parse(output).toStringAsFixed(2);
            context
                .read<TransferConfirmBloc>()
                .add(TransferAmountChanged(double.parse(amount)));
          },
        );
      },
    );
  }
}

class TransferBalanceAmountOption extends StatelessWidget {
  const TransferBalanceAmountOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const amountOption1 = 10.0;
    const amountOption2 = 25.0;
    const amountOption3 = 50.0;
    return BlocBuilder<TransferConfirmBloc, TransferConfirmState>(
      builder: (context, state) {
        return SizedBox(
          height: 36,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              TransferBalanceAmountOptionDetail(
                  amount: state.amount * amountOption1,
                  amountOption: amountOption1),
              TransferBalanceAmountOptionDetail(
                  amount: state.amount * amountOption2,
                  amountOption: amountOption2),
              TransferBalanceAmountOptionDetail(
                  amount: state.amount * amountOption3,
                  amountOption: amountOption3)
            ],
          ),
        );
      },
    );
  }
}

class TransferBalanceAmountOptionDetail extends StatelessWidget {
  const TransferBalanceAmountOptionDetail(
      {Key? key, required this.amount, required this.amountOption})
      : super(key: key);

  final double amount;
  final double amountOption;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 4, right: 4),
      height: 36,
      child: ElevatedButton(
        onPressed: () {
          amount == 0
              ? context.read<TransferConfirmBloc>().add(TransferAmountChanged(amountOption * 10))
              : context
                  .read<TransferConfirmBloc>()
                  .add(TransferAmountChanged(double.parse(amount.toStringAsFixed(2))));
        },
        style: const ButtonStyle(
            elevation: MaterialStatePropertyAll(0),
            backgroundColor:
                MaterialStatePropertyAll(AppColors.buttonLightGreen)),
        child: Text(
          amount == 0
              ? dWalletFormatCard.currencyFormat.format(amountOption * 10)
              : dWalletFormatCard.currencyFormat.format(amount),
          style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.textNeonGreen,
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

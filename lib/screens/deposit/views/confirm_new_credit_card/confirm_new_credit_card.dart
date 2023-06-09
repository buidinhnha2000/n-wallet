import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../common/extensions/extensions.dart';
import '../../../../common/widgets/widgets.dart';
import '../../../../l10n/l10n.dart';
import '../../../../models/domain/credit_card/credit_card_creation.dart';
import '../../../../navigation/navigation.dart';
import '../../../../theme/app_color.dart';
import '../add_new_credit_card/bloc/new_credit_card_bloc.dart';

class DepositConfirmNewCreditCard extends StatelessWidget {
  const DepositConfirmNewCreditCard({Key? key, required this.creditCard})
      : super(key: key);

  final CreditCardCreation creditCard;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewCreditCardBloc(context.read()),
      child: BlocBuilder<NewCreditCardBloc, NewCreditCardState>(
        builder: (context, state) {
          return Stack(
            children: [
              DWalletDepositAndTransferLayout(
                  isAppBar: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          context.l10n.text_add_card_confirm,
                          style: context.textTheme.titleMedium?.copyWith(
                            color: AppColors.textBlack,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          context.l10n.text_your_card,
                          style: context.textTheme.bodyMedium
                              ?.copyWith(color: AppColors.textBlackLight),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        DWalletCreditCard(
                          cardNumber: creditCard.number,
                          expiration:
                              '${creditCard.expMonth}/${creditCard.expYear}',
                          holderName: creditCard.name,
                          brand: creditCard.cardType,
                          cardBackground: AppColors.primaryOrange,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Divider(
                              color: AppColors.iconGrey.withOpacity(0.3)),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: DWalletButton(
                                onPressed: () {
                                  context.navigator.pop();
                                },
                                color: AppColors.iconGrey.withOpacity(0.6),
                                text: context.l10n.text_cancel,
                                buttonType: ButtonType.onlyText,
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: BlocConsumer<NewCreditCardBloc,
                                  NewCreditCardState>(
                                listener: (context, state) {
                                  if (state.status.isSubmissionSuccess) {
                                    context.navigator.pushNamed(
                                        AppRoutes.depositAddCardSuccess);
                                  }
                                },
                                builder: (context, state) {
                                  return DWalletButton(
                                    onPressed: () {
                                      final noneWhiteSpace =
                                          creditCard.number.replaceAll(' ', '');
                                      context.read<NewCreditCardBloc>().add(
                                            CreditCardSubmitted(
                                              creditCard.copyWith(
                                                  number: noneWhiteSpace),
                                            ),
                                          );
                                    },
                                    color: AppColors.buttonNeonGreen,
                                    text: context.l10n.text_add_card,
                                    buttonType: ButtonType.onlyText,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        )
                      ],
                    ),
                  )),
              if (state.status.isSubmissionInProgress) const DWalletLoader()
            ],
          );
        },
      ),
    );
  }
}

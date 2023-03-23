import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../common/extensions/extensions.dart';
import '../../../../common/widgets/d_wallet_credit_card.dart';
import '../../../../common/widgets/widgets.dart';
import '../../../../l10n/l10n.dart';
import '../../../../models/domain/credit_card/credit_card_creation.dart';
import '../../../../navigation/navigation.dart';
import '../../../../theme/app_color.dart';
import '../../input_formatters/card_number_input_formatter.dart';
import '../../input_formatters/input_formatters.dart';
import '../../input_formatters/uppercase_input_formatter.dart';
import '../../utils/card_brand_widget.dart';
import '../../validations/validations.dart';
import 'bloc/new_credit_card_bloc.dart';

class DepositNewCreditCard extends StatelessWidget {
  const DepositNewCreditCard({
    Key? key,
  }) : super(key: key);

  bool completedAddCreditCardForm(String name, String cardNumber,
      String expMonth, String expYear, String cvc) {
    return name.isNotEmpty &&
            cardNumber.isNotEmpty &&
            expMonth.isNotEmpty &&
            expYear.isNotEmpty &&
            cvc.isNotEmpty
        ? true
        : false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewCreditCardBloc(context.read()),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: DWalletDepositAndTransferLayout(
          title: context.l10n.text_add_new_card,
          desc: context.l10n.text_desc_add_new_card,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView(
                    children: [
                      BlocBuilder<NewCreditCardBloc, NewCreditCardState>(
                        builder: (context, state) {
                          return DWalletCreditCard(
                            cardBackground: AppColors.iconGrey.withOpacity(0.2),
                            cardNumber: state.cardNumber.value,
                            expiration: '${state.expMonth}/${state.expYear}',
                            holderName: state.name.value,
                            brand: state.brand,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const CreditCardFormData(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: BlocConsumer<NewCreditCardBloc, NewCreditCardState>(
                  listener: (context, state) {
                    if (state.status.isSubmissionSuccess) {}
                  },
                  builder: (context, state) {
                    return DWalletButton(
                      onPressed: () {
                        final CreditCardCreation creditCard =
                            CreditCardCreation(
                                name: state.name.value,
                                number: state.cardNumber.value,
                                expYear: state.expYear,
                                expMonth: state.expMonth,
                                cvc: state.cvc,
                                cardType: state.brand);
                        if (completedAddCreditCardForm(
                                state.name.value,
                                state.cardNumber.value,
                                state.expMonth,
                                state.expYear,
                                state.cvc) &&
                            state.name.valid) {
                          context.navigator.pushNamed(
                              AppRoutes.depositConfirmCreditCard,
                              arguments: creditCard);
                        }
                      },
                      text: context.l10n.text_continue,
                      color: AppColors.primaryNeonGreen,
                      buttonType: ButtonType.onlyText,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 32,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CreditCardFormData extends StatelessWidget {
  const CreditCardFormData({
    super.key,
  });

  TextStyle? styleLabelTextField(BuildContext context) {
    return context.textTheme.titleMedium?.copyWith(
        color: AppColors.iconGrey, fontSize: 15, fontWeight: FontWeight.w300);
  }

  String showErrorMessage(NameCreditCardValidation name, BuildContext context) {
    return (name.pure || name.valid || name.value.isEmpty)
        ? ''
        : context.l10n.text_holder_name_invalid;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<NewCreditCardBloc, NewCreditCardState>(
          builder: (context, state) {
            return Column(
              children: [
                DWalletTextField(
                  hintText: 'Cardholder Name',
                  inputFormatters: [
                    UpperCaseTextFormatter(),
                  ],
                  onChanged: (value) {
                    context
                        .read<NewCreditCardBloc>()
                        .add(NameCreditCardChanged(value));
                  },
                ),
                const SizedBox(
                  height: 3,
                ),
                DWalletTextValidation(
                    textValidator: showErrorMessage(state.name, context)),
              ],
            );
          },
        ),
        const SizedBox(
          height: 8,
        ),
        BlocBuilder<NewCreditCardBloc, NewCreditCardState>(
          builder: (context, state) {
            final brandCardType = state.cardNumber.error;

            return DWalletTextField(
              hintText: 'Card Number',
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(16),
                CardNumberInputFormatter(),
              ],
              onChanged: (value) {
                context
                    .read<NewCreditCardBloc>()
                    .add(NumberCreditCardChanged(value));
                value.isNotEmpty
                    ? context.read<NewCreditCardBloc>().add(
                        BrandCreditCardChanged(
                            brandCardType ?? CardType.Others))
                    : context
                        .read<NewCreditCardBloc>()
                        .add(const BrandCreditCardChanged(null));
              },
              suffixIcon: CardBrand.handleShowIconBrand(state.brand),
            );
          },
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          children: [
            Expanded(
              child: DWalletTextField(
                hintText: 'Expiry Date',
                keyboardType: TextInputType.number,
                inputFormatters: [
                  ExpirationDateFormatter(),
                ],
                onChanged: (value) {
                  context.read<NewCreditCardBloc>().add(
                        ExpiryDateCreditCardChanged(value),
                      );
                },
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: DWalletTextField(
              hintText: '3-digit CVV',
              keyboardType: TextInputType.number,
              isPassword: true,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(3),
              ],
              onChanged: (value) {
                context
                    .read<NewCreditCardBloc>()
                    .add(CvcCreditCardChanged(value));
              },
            )),
          ],
        )
      ],
    );
  }
}

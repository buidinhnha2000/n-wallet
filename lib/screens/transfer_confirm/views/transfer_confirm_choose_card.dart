import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../common/assets/app_assets.dart';
import '../../../../common/extensions/context.dart';
import '../../../../common/widgets/d_wallet_button.dart';
import '../../../../l10n/l10n.dart';
import '../../../../theme/app_color.dart';
import '../../../navigation/navigation.dart';
import '../../transfer_balance/views/transfer_model.dart';
import '../bloc/transfer_confirm_bloc.dart';

class TransferConfirmScreenChooseCard extends StatelessWidget {
  const TransferConfirmScreenChooseCard({Key? key, required this.transferModel, this.numberCard})
      : super(key: key);

  final TransferModel transferModel;
  final String? numberCard;

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: AppColors.backgroundWhite,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(32),
                      topLeft: Radius.circular(32))),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, top: 37, right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TransferConfirmScreenChooseCardTitle(numberCard: numberCard),
                    const SizedBox(height: 24),
                    BlocListener<TransferConfirmBloc, TransferConfirmState>(
                        listener: (context, state) async {
                          if (state.transferBalance == null) {
                          } else {
                            await context.navigator
                                .pushNamed(AppRoutes.transferBalance);
                          }
                        },
                        child: SizedBox(
                          height: 54,
                          child: DWalletButton(
                            onPressed: () async {
                              context
                                  .read<TransferConfirmBloc>()
                                  ..add(TransferIdChanged(transferModel.idUser))
                                  ..add(TransferAmountChanged(transferModel.amount))
                                  ..add(TransferNotesChanged(transferModel.notes))
                                  ..add(TransferSubmitChanged());
                            },
                            text: context.l10n.text_transfer_money,
                            color: AppColors.buttonNeonGreen,
                            buttonType: ButtonType.onlyText,
                          ),
                        )),
                    const SizedBox(
                      height: 32,
                    )
                  ],
                ),
              ),
            ),
          ],
        );
  }
}

class TransferConfirmScreenChooseCardTitle extends StatelessWidget {
  const TransferConfirmScreenChooseCardTitle({Key? key, this.numberCard}) : super(key: key);
  final String? numberCard;
  @override
  Widget build(BuildContext context) {
    var i = 0;
    final dashes = {1, 2, 3};
    final numberCardChoose = numberCard?.splitMapJoin(RegExp('....'),
        onNonMatch: (s) => dashes.contains(i++) ? '-' : '');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.text_choose_card,
          style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.textBlack,
              fontSize: 18,
              fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
              color: AppColors.backgroundBlackLight,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 48,
                    decoration: const BoxDecoration(
                        color: AppColors.backgroundWhite,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: const Image(
                      image: AssetImage(AppAssets.logoApp),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.l10n.text_balance_virtual_card,
                        style: context.textTheme.bodyMedium?.copyWith(
                            color: AppColors.textBlack,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        numberCardChoose ?? '',
                        style: context.textTheme.bodyMedium?.copyWith(
                            color: AppColors.textLightBlack,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  )
                ],
              ),
              SvgPicture.asset(
                AppAssets.iconMoreBlue,
                width: 24,
                height: 24,
              )
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../l10n/l10n.dart';
import '../../../theme/app_color.dart';
import '../../assets/app_assets.dart';
import '../../extensions/context.dart';
import 'card_format.dart';
import 'card_number_hide.dart';

class DWalletCard extends StatelessWidget {
  const DWalletCard(
      {Key? key,
      required this.numberCard,
      required this.money,
      required this.cardBackground,
      this.cardExpiration,
      this.text})
      : super(key: key);
  final String numberCard;
  final double money;
  final String? text;
  final Color? cardBackground;
  final String? cardExpiration;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 186,
      margin: const EdgeInsets.only(left: 16, right: 16),
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      decoration: BoxDecoration(
          color: cardBackground,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text ?? '',
                      style: context.textTheme.bodySmall?.copyWith(
                          color: AppColors.textWhite,
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(dWalletFormatCard.currencyFormat.format(money),
                      style: context.textTheme.bodySmall?.copyWith(
                          color: AppColors.textWhiteBlack,
                          fontSize: 24,
                          fontWeight: FontWeight.w700)),
                ],
              ),
              SizedBox(
                  height: 28,
                  width: 45,
                  child: SvgPicture.asset(AppAssets.iconLogoCard)),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            height: 28,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    height: 28,
                    width: 40,
                    child: SvgPicture.asset(AppAssets.iconCardChip)),
                const SizedBox(
                  width: 16,
                ),
                const DWalletCardHide(),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  numberCard.substring(numberCard.length - 4),
                  style: context.textTheme.bodySmall?.copyWith(
                      color: AppColors.textWhite,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(context.l10n.text_bianca_cooper,
                  style: context.textTheme.bodySmall?.copyWith(
                      color: AppColors.textWhite,
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
              Text(cardExpiration ?? '',
                  style: context.textTheme.bodySmall?.copyWith(
                      color: AppColors.textWhite,
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
            ],
          )
        ],
      ),
    );
  }
}

class CreditCardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String maskedValue = _getMaskedNumber(newValue.text);
    return TextEditingValue(
      text: maskedValue,
      selection: TextSelection.collapsed(offset: maskedValue.length),
    );
  }

  String _getMaskedNumber(String number) {
    String stripped = number.replaceAll(RegExp(r'\D'), ''); // remove non-digits
    if (stripped.length > 4) {
      stripped =
          '${stripped.substring(0, stripped.length - 4)}****'; // mask all but the last 4 digits
    }
    return stripped.replaceAllMapped(RegExp(r'.{4}'),
        (match) => '${match.group(0)} '); // add spacing for readability
  }
}

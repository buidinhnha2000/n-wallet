import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../screens/deposit/utils/card_brand_widget.dart';
import '../../screens/deposit/validations/number_credit_card_validation.dart';
import '../../theme/app_color.dart';
import '../assets/app_assets.dart';
import '../extensions/extensions.dart';

class DWalletCreditCard extends StatelessWidget {
  const DWalletCreditCard({
    Key? key,
    this.cardBackground,
    this.cardNumber = '',
    this.holderName = '',
    this.expiration = '',
    this.brand,
    this.isHideCardNumber = true,
  }) : super(key: key);
  final Color? cardBackground;
  final String cardNumber;
  final String holderName;
  final String expiration;
  final CardType? brand;
  final bool isHideCardNumber;

  Widget hideCardNumber(BuildContext context) {
    return isHideCardNumber
        ? Text(
            cardNumber,
            style: context.textTheme.titleMedium?.copyWith(
              color: AppColors.textLightBlack,
              fontSize: 20,
            ),
          )
        : const Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '● ● ● ●  ● ● ● ●  4444',
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 186,
      //margin: const EdgeInsets.only(left: 16, right: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: cardBackground,
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CardBrand.handleShowIconBrand(brand) ??
                  const SizedBox(
                    height: 28,
                  ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(AppAssets.iconCardChip),
              const SizedBox(
                width: 16,
              ),
              hideCardNumber(context),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                holderName,
                style: context.textTheme.titleLarge?.copyWith(
                    color: AppColors.textLightBlack,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                expiration,
                style: context.textTheme.titleLarge?.copyWith(
                  color: AppColors.textLightBlack,
                  fontSize: 20,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

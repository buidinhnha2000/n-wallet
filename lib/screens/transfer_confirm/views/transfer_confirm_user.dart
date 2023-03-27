import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../../../../common/assets/app_assets.dart';
import '../../../../common/extensions/context.dart';
import '../../../../common/widgets/card/card_format.dart';
import '../../../../l10n/l10n.dart';
import '../../../../theme/app_color.dart';

class TransferConfirmScreenUser extends StatelessWidget {
  const TransferConfirmScreenUser(
      {Key? key, required this.name, required this.amount, this.numberCard})
      : super(key: key);
  final String name;
  final double amount;
  final String? numberCard;

  @override
  Widget build(BuildContext context) {
    var i = 0;
    final dashes = {1, 2, 3};
    final numberCardUser = numberCard?.splitMapJoin(RegExp('....'),
        onNonMatch: (s) => dashes.contains(i++) ? '-' : '');
    final timeTransfer = DateFormat.yMMMd('en_US').format(DateTime.now());

    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 80,
            width: 80,
            child: CircleAvatar(
                backgroundImage: AssetImage(AppAssets.imageAvatar)),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            name,
            style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.textWhite,
                fontSize: 24,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            numberCardUser ?? '',
            style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.textWhite,
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            '${context.l10n.text_transfer_on} $timeTransfer',
            style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.textYellow,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 40),
          Text(
            dWalletFormatCard.currencyFormat.format(amount),
            style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.textWhite,
                fontSize: 48,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColors.backgroundWhite.withOpacity(0.1),
                borderRadius: const BorderRadius.all(Radius.circular(16))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: SvgPicture.asset(AppAssets.iconWarning,
                      height: 16, width: 16),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    context.l10n.text_confirm_transfer_warning,
                    style: context.textTheme.bodyMedium?.copyWith(
                        color: AppColors.textWhiteBlack,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

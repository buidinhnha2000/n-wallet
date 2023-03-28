import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/assets/app_assets.dart';
import '../../../common/extensions/context.dart';
import '../../../common/widgets/card/card_format.dart';
import '../../../common/widgets/item.dart';
import '../../../l10n/l10n.dart';
import '../../../theme/app_color.dart';
import '../bloc/history_bloc.dart';

class HistoryScreenSpending extends StatelessWidget {
  const HistoryScreenSpending({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Text(
            context.l10n.text_spendings,
            style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.textBlack,
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(height: 16),
        const HistoryScreenMainAction(),
        const HistoryScreenSpendingViewStatistic(),
      ],
    );
  }
}

class HistoryScreenMainAction extends StatelessWidget {
  const HistoryScreenMainAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 92,
      child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          children: List.generate(actionMainHistory.length, (index) {
            return GestureDetector(
              onTap: () =>
                  context.navigator.pushNamed(actionMainHistory[index].route),
              child: Container(
                height: 92,
                width: 140,
                margin: const EdgeInsets.only(left: 16),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    color: actionMainHistory[index].color),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(actionMainHistory[index].img,
                        height: 32, width: 32),
                    const SizedBox(height: 8),
                    Text(
                      actionMainHistory[index].text,
                      style: context.textTheme.bodyMedium?.copyWith(
                          color: AppColors.textWhite,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            );
          })),
    );
  }
}

class HistoryScreenSpendingViewStatistic extends StatelessWidget {
  const HistoryScreenSpendingViewStatistic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: AppColors.buttonSalmon.withOpacity(0.1),
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 48,
              width: 48,
              padding: const EdgeInsets.only(top: 2),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.buttonSalmon),
              child: SvgPicture.asset(
                AppAssets.iconLess,
                height: 24,
                width: 24,
                fit: BoxFit.scaleDown,
              ),
            ),
            const SizedBox(width: 16),
            const HistoryScreenSpendingViewStatisticTwoMonth(),
          ],
        ),
      ),
    );
  }
}

class HistoryScreenSpendingViewStatisticTwoMonth extends StatelessWidget {
  const HistoryScreenSpendingViewStatisticTwoMonth({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, state) {
        final twoMonth =
        dWalletFormatCard.currencyFormat.format(state.twoMonth ?? 0);
        return Flexible(
          child: Column(
            children: [
              Text(
                '${context.l10n
                    .text_history_spending_desc_first} $twoMonth ${context.l10n
                    .text_history_spending_desc_last}',
                style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.textLightBlack,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    context.l10n.text_history_pending_view_statistic,
                    style: context.textTheme.bodyMedium?.copyWith(
                        color: AppColors.textYellow,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  SvgPicture.asset(
                    AppAssets.iconNext,
                    color: AppColors.textYellow,
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}


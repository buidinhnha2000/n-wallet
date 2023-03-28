import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../common/assets/app_assets.dart';
import '../../../common/extensions/context.dart';
import '../../../common/widgets/card/card_format.dart';
import '../../../l10n/l10n.dart';
import '../../../models/history/history_data.dart';
import '../../../theme/app_color.dart';
import '../bloc/history_bloc.dart';

class HistoryScreenExpenses extends StatelessWidget {
  const HistoryScreenExpenses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.text_expenses,
            style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.textBlack,
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
          BlocBuilder<HistoryBloc, HistoryState>(
            builder: (context, state) {
              return ListView.builder(
                  reverse: true,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.all(0),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.history?.historyDataJson?.length ?? 0,
                  itemBuilder: (context, index) {
                    HistoryDataJson? history =
                        state.history?.historyDataJson?[index];
                    DateTime timeApi = DateTime.parse(history?.createdAt ?? '');
                    final timeTransfer =
                        DateFormat.yMMMd('en_US').format(timeApi);
                    final timeInDay = DateFormat('hh:mm a').format(timeApi);

                    final amount = dWalletFormatCard.currencyFormat
                        .format(double.parse('-${history?.amount.toString()}'));

                    return GestureDetector(
                      child: Column(
                        children: [
                          HistoryScreenExpensesList(
                              history: history,
                              timeTransfer: timeTransfer,
                              timeInDay: timeInDay,
                              amount: amount),
                          const SizedBox(height: 16),
                          const Divider(
                            height: 2,
                            color: AppColors.dividerBlackLight,
                          )
                        ],
                      ),
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}

class HistoryScreenExpensesList extends StatelessWidget {
  const HistoryScreenExpensesList(
      {Key? key,
      this.history,
      required this.timeTransfer,
      required this.timeInDay,
      required this.amount})
      : super(key: key);
  final HistoryDataJson? history;
  final String timeTransfer, timeInDay, amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      margin: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 48,
                width: 48,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: AppColors.buttonGreen),
                child: SvgPicture.asset(AppAssets.iconStarbucks,
                    height: 24, width: 24, fit: BoxFit.scaleDown),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    history?.receiver?.name ?? '',
                    style: context.textTheme.bodyMedium?.copyWith(
                        color: AppColors.textBlack,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 4),
                  HistoryScreenExpensesListDateTime(
                    timeTransfer: timeTransfer,
                    timeInDay: timeInDay,
                  )
                ],
              )
            ],
          ),
          Text(
            amount,
            style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.textBlack,
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class HistoryScreenExpensesListDateTime extends StatelessWidget {
  const HistoryScreenExpensesListDateTime(
      {Key? key, required this.timeTransfer, required this.timeInDay})
      : super(key: key);
  final String timeTransfer, timeInDay;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          timeTransfer,
          style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.textLightBlack,
              fontSize: 14,
              fontWeight: FontWeight.w400),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: SvgPicture.asset(
            AppAssets.iconEllipse,
            width: 3,
            height: 3,
            fit: BoxFit.scaleDown,
            color: AppColors.iconGrey,
          ),
        ),
        Text(
          timeInDay,
          style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.textLightBlack,
              fontSize: 14,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/assets/app_assets.dart';
import '../../../common/extensions/context.dart';
import '../../../l10n/l10n.dart';
import '../../../theme/app_color.dart';
import '../bloc/history_bloc.dart';

class HistoryScreenExpenses extends StatelessWidget {
  const HistoryScreenExpenses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Text(
            context.l10n.text_expenses,
            style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.textBlack,
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
        ),
        BlocBuilder<HistoryBloc, HistoryState>(
          builder: (context, state) {
            return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(0),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.history?.historyDataJson?.length ?? 0,
              itemBuilder:(context, index) {
                // String? a = state.history?.historyDataJson?[index].amount.toString();
                // print(a);
                return GestureDetector(
                  child: Container(
                    height: 48,
                    margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 48,
                              width: 48,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                                  color: AppColors.buttonGreen),
                              child: SvgPicture.asset(AppAssets.iconStarbucks,
                                  height: 24, width: 24, fit: BoxFit.scaleDown),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  context.l10n.text_starbucks,
                                  style: context.textTheme.bodyMedium?.copyWith(
                                      color: AppColors.textBlack,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Text(
                                      context.l10n.text_starbucks,
                                      style: context.textTheme.bodyMedium
                                          ?.copyWith(
                                          color: AppColors.textLightBlack,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: SvgPicture.asset(
                                        AppAssets.iconEllipse,
                                        width: 3,
                                        height: 3,
                                        fit: BoxFit.scaleDown,
                                        color: AppColors.iconGrey,
                                      ),
                                    ),
                                    Text(
                                      context.l10n.text_starbucks,
                                      style: context.textTheme.bodyMedium
                                          ?.copyWith(
                                          color: AppColors.textLightBlack,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        Text(
                          state.history?.historyDataJson?[index].amount.toString() ?? '',
                          style: context.textTheme.bodyMedium?.copyWith(
                              color: AppColors.textBlack,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                );
              }
            );
          },
        ),
      ],
    );
  }
}

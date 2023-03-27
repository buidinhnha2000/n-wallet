import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/assets/app_assets.dart';
import '../../common/widgets/header/header.dart';
import '../../l10n/l10n.dart';
import '../../navigation/navigation.dart';
import '../../theme/app_color.dart';
import 'bloc/history_bloc.dart';
import 'views/history_expenses.dart';
import 'views/history_spending.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryBloc(context.read())..add(LoadHistory()),
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.backgroundGreen,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 60, bottom: 24),
                  child: HeaderScreen(
                      onTab: AppRoutes.search,
                      iconLeft: true,
                      iconRight: true,
                      icon: AppAssets.iconFilter,
                      title: context.l10n.text_payment_history),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  padding: const EdgeInsets.only(top: 16),
                  decoration: const BoxDecoration(
                      color: AppColors.backgroundWhite,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(32),
                          topLeft: Radius.circular(32))),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(0),
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 5,
                            width: 48,
                            decoration: const BoxDecoration(
                                color: AppColors.dividerBlackLight,
                                borderRadius:
                                BorderRadius.all(
                                    Radius.circular(100))),
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      const HistoryScreenSpending(),
                      const HistoryScreenExpenses()

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

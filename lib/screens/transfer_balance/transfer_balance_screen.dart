import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/transfer_balance_bloc.dart';
import 'views/transfer_balance_amount.dart';
import 'views/transfer_balance_contact.dart';
import 'views/transfer_balance_recent.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/d_wallet_button.dart';
import '../../../common/widgets/header/header.dart';
import '../../../l10n/l10n.dart';
import '../../../models/profile/profile.dart';
import '../../../navigation/navigation.dart';
import '../../../theme/app_color.dart';

class TransferBalanceScreen extends StatefulWidget {
  const TransferBalanceScreen({Key? key, this.profile}) : super(key: key);

  final ProfileJson? profile;

  @override
  State<TransferBalanceScreen> createState() => _TransferBalanceScreenState();
}

class _TransferBalanceScreenState extends State<TransferBalanceScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: BlocProvider(
        create: (context) =>
            TransferBalanceBloc(),
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
                      title: context.l10n.text_transfer_balance),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  decoration: const BoxDecoration(
                      color: AppColors.backgroundWhite,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(32),
                          topLeft: Radius.circular(32))),
                  child: Stack(
                    children: [
                      Positioned(
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Column(
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
                                const TransferBalanceScreenContact(),
                                const TransferBalanceScreenRecent(),
                                const TransferBalanceScreenAmount(),
                              ],
                            ),
                          )),
                      Positioned(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              DWalletButton(
                                onPressed: () {},
                                text: context.l10n.text_continue,
                                color: AppColors.buttonNeonGreen,
                                buttonType: ButtonType.onlyText,
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                            ],
                          ),
                        ),
                      ),
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
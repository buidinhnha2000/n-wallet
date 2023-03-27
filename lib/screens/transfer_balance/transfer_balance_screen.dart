import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/widgets/divider/divider.dart';
import '../../di/service_locator.dart';
import '../../models/search/search_profile.dart';
import '../transfer_confirm/bloc/transfer_confirm_bloc.dart';
import 'bloc/transfer_balance_bloc.dart';
import 'views/transfer_balance_amount.dart';
import 'views/transfer_balance_button.dart';
import 'views/transfer_balance_contact.dart';
import 'views/transfer_balance_header.dart';
import 'views/transfer_balance_notes.dart';
import 'views/transfer_balance_recent.dart';
import 'package:flutter/material.dart';
import '../../../theme/app_color.dart';
import 'views/transfer_model.dart';

class TransferBalanceScreen extends StatelessWidget {
  const TransferBalanceScreen({Key? key, this.searchProfile}) : super(key: key);

  final SearchProfileJson? searchProfile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => TransferBalanceBloc()),
          BlocProvider(
              create: (context) =>
                  TransferConfirmBloc(ServiceLocator.instance.inject())),
        ],
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.backgroundGreen,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TransferBalanceScreenHeader(),
              Expanded(
                flex: 5,
                child: Container(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  decoration: const BoxDecoration(
                      color: AppColors.backgroundWhite,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(32),
                          topLeft: Radius.circular(32))),
                  child: BlocBuilder<TransferBalanceBloc, TransferBalanceState>(
                    builder: (context, state) {
                      return BlocBuilder<TransferConfirmBloc,
                          TransferConfirmState>(
                        builder: (context, state) {
                          return Stack(
                            children: [
                              ListView(
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(0),
                                scrollDirection: Axis.vertical,
                                physics: const AlwaysScrollableScrollPhysics(),
                                children: [
                                  const DividerDWallet(),
                                  const TransferBalanceScreenContact(),
                                  const TransferBalanceScreenRecent(),
                                  const TransferBalanceScreenAmount(),
                                  TransferBalanceScreenNotes(
                                      searchProfile: searchProfile),
                                ],
                              ),
                              TransferBalanceButton(
                                  transferModel: TransferModel(
                                      searchProfile?.id ?? 0,
                                      state.amount,
                                      state.notes ?? '',
                                      searchProfile?.name ?? '')),
                            ],
                          );
                        },
                      );
                    },
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

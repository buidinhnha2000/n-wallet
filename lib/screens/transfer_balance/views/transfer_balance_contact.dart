import 'package:flutter/material.dart';

import '../../../../common/assets/app_assets.dart';
import '../../../../common/extensions/context.dart';
import '../../../../common/widgets/d_wallet_button.dart';
import '../../../../common/widgets/form_text/d_wallet_text_field.dart';
import '../../../../l10n/l10n.dart';
import '../../../../navigation/navigation.dart';
import '../../../../theme/app_color.dart';

class TransferBalanceScreenContact extends StatelessWidget {
  const TransferBalanceScreenContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.text_contact,
          style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.textBlack,
              fontSize: 18,
              fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 48,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: InkWell(
                  onTap: () => context.navigator.pushNamed(AppRoutes.search),
                  child: DWalletTextField(
                    hintText: context.l10n.text_enter_phone_number,
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 48,
                      width: 48,
                      child: DWalletButton(
                        buttonType: ButtonType.onlyIcon,
                        color: AppColors.buttonSalmon,
                        imageIcon: AppAssets.iconAdd,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
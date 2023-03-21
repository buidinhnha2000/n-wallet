import 'package:flutter/material.dart';

import '../../theme/app_color.dart';
import '../assets/app_assets.dart';
import '../extensions/extensions.dart';
import 'd_wallet_appbar.dart';

class DWalletDepositAndTransferLayout extends StatelessWidget {
  const DWalletDepositAndTransferLayout(
      {Key? key,
      this.title,
      this.onPressed,
      this.desc,
      required this.child,
      this.isAppBar = true})
      : super(key: key);
  final String? title;
  final String? desc;
  final Function()? onPressed;
  final Widget child;
  final bool isAppBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryGreen,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isAppBar)
                    DWalletAppBar(
                      text: title ?? '',
                      textColor: AppColors.textWhite,
                      buttonColor: Colors.transparent,
                      icon: AppAssets.iconBackWhite,
                      onPressed: () {
                        context.navigator.pop();
                      },
                    ),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    desc ?? '',
                    style: context.textTheme.titleSmall?.copyWith(
                        color: AppColors.textWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.w200),
                  )
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  if (!isAppBar)
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      margin: const EdgeInsets.only(top: 0),
                      decoration: BoxDecoration(
                        color: AppColors.textWhite.withOpacity(0.2),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(32.0),
                          topRight: Radius.circular(32.0),
                        ),
                      ),
                    ),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    margin: const EdgeInsets.only(top: 27.0),
                    decoration: const BoxDecoration(
                      color: AppColors.textWhite,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32.0),
                        topRight: Radius.circular(32.0),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Divider(
                            thickness: 6,
                            indent: 160,
                            endIndent: 160,
                            color: AppColors.buttonBorder1,
                          ),
                        ),
                        Expanded(child: child)
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

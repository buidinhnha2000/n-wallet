import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../l10n/l10n.dart';
import '../../theme/app_color.dart';
import '../assets/app_assets.dart';
import '../extensions/context.dart';

void modalError(BuildContext context, String text,
    {required VoidCallback onPressed}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: AppColors.backgroundBlack.withOpacity(0.2),
    builder: (context) {
      return AlertDialog(
        alignment: Alignment.center,
        backgroundColor: AppColors.backgroundLightGreen,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        content: SizedBox(
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blue),
                child: SvgPicture.asset(AppAssets.iconSuccess, height: 50),
              ),
              const SizedBox(height: 35.0),
              Text(
                textAlign: TextAlign.center,
                text,
                style: context.textTheme.bodyMedium?.copyWith(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textWhite),
              ),
              const SizedBox(height: 25.0),
              InkWell(
                onTap: onPressed,
                child: Container(
                  alignment: Alignment.center,
                  height: 35,
                  width: 100,
                  decoration: BoxDecoration(
                      color: AppColors.buttonLightSalmon,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Text(
                    context.l10n.text_done,
                    style: context.textTheme.bodyMedium?.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textBlack),
                  ),
                ),
              )
            ],
          ),
        ),

      );
    },
  );
}

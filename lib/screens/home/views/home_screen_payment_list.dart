import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../common/extensions/context.dart';
import '../../../common/widgets/item.dart';
import '../../../l10n/l10n.dart';
import '../../../theme/app_color.dart';

class HomeScreenPaymentList extends StatelessWidget {
  const HomeScreenPaymentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.text_payment_list,
            style: context.textTheme.bodyLarge?.copyWith(
                color: AppColors.textBlack,
                fontWeight: FontWeight.w700,
                fontSize: 18),
          ),
          const SizedBox(
            height: 16,
          ),
          StaggeredGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 16,
            children: List.generate(itemPaymentList.length, (index) {
              return Column(
                children: [
                  Container(
                    height: 56,
                    width: 56,
                    decoration: const BoxDecoration(
                        color: AppColors.backgroundItem,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Center(
                      child: SvgPicture.asset(
                        itemPaymentList[index].img,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Center(
                    child: Text(
                      itemPaymentList[index].text,
                      style: context.textTheme.bodyMedium?.copyWith(
                          color: AppColors.textBlack,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}

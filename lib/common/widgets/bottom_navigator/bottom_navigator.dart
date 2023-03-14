import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../assets/app_assets.dart';

class BottomNavigationBarCustom extends StatelessWidget {
  const BottomNavigationBarCustom(
      {Key? key, required this.index, required this.onTap})
      : super(key: key);
  final int index;
  final Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                onTap(0);
              },
              icon: SvgPicture.asset(index == 0
                  ? AppAssets.iconNavigatorHomeOn
                  : AppAssets.iconNavigatorHome)),
          IconButton(
              onPressed: () {
                onTap(1);
              },
              icon: SvgPicture.asset(index == 1
                  ? AppAssets.iconNavigatorStatisticOn
                  : AppAssets.iconNavigatorStatistic)),
          const SizedBox(),
          IconButton(
              onPressed: () {
                onTap(2);
              },
              icon: SvgPicture.asset(index == 2
                  ? AppAssets.iconNavigatorNotification
                  : AppAssets.iconNavigatorNotification)),
          IconButton(
              onPressed: () {
                onTap(3);
              },
              icon: SvgPicture.asset(index == 3
                  ? AppAssets.iconNavigatorProfileOn
                  : AppAssets.iconNavigatorProfile)),
        ],
      ),
    );
  }
}

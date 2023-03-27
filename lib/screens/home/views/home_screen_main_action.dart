import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/extensions/context.dart';
import '../../../common/widgets/item.dart';
import '../../../navigation/navigation.dart';
import '../../../theme/app_color.dart';

class HomeScreenMainAction extends StatefulWidget {
  const HomeScreenMainAction({Key? key}) : super(key: key);

  @override
  State<HomeScreenMainAction> createState() => _HomeScreenMainActionState();
}

class _HomeScreenMainActionState extends State<HomeScreenMainAction> {
  static List<String> pages = <String>[
    AppRoutes.transferBalance,
    AppRoutes.depositSelectMethod,
    AppRoutes.history,
  ];

  void _onNavigator(int index) {
    setState(() {
      Navigator.of(context).pushNamed(pages[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 24),
      padding: const EdgeInsets.only(),
      height: 84,
      decoration: BoxDecoration(
          color: AppColors.dividerGreen,
          borderRadius: BorderRadius.circular(16)),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              HomeScreenMainActionDivider(),
              HomeScreenMainActionDivider(),
            ],
          ),
          Row(
            children: List.generate(actionMainHome.length, (index) {
              return Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    _onNavigator(index);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        actionMainHome[index].img,
                        height: 32,
                        width: 32,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(actionMainHome[index].text,
                          style: context.textTheme.bodyMedium
                              ?.copyWith(color: AppColors.textWhite))
                    ],
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}

class HomeScreenMainActionDivider extends StatelessWidget {
  const HomeScreenMainActionDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 1,
          height: 40,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                AppColors.dividerGreen,
                AppColors.dividerLightGreen,
              ],
                  stops: [
                0.0,
                1.0
              ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  tileMode: TileMode.repeated)),
        ),
      ],
    );
  }
}

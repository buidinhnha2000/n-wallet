import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../blocs/authentication/authentication_cubit.dart';
import '../../../common/assets/app_assets.dart';
import '../../../common/extensions/context.dart';
import '../../../common/widgets/item.dart';
import '../../../navigation/navigation.dart';
import '../../../theme/app_color.dart';

class ProfileScreenSetting extends StatelessWidget {
  const ProfileScreenSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
      child: SingleChildScrollView(
        child: Column(
            children: List.generate(itemProfileSetting.length, (index) {
          return GestureDetector(
            onTap: () {
              if (itemProfileSetting[index].route == AppRoutes.signOption) {
                context.read<AuthenticationCubit>().unsetUserLogged();
              }
              context.navigator.pushNamed(itemProfileSetting[index].route);
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(itemProfileSetting[index].img),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(itemProfileSetting[index].text,
                          style: context.textTheme.bodySmall?.copyWith(
                              color: AppColors.textBlack,
                              fontSize: 16,
                              fontWeight: FontWeight.w500))
                    ],
                  ),
                  SvgPicture.asset(AppAssets.iconNext),
                ],
              ),
            ),
          );
        })),
      ),
    );
  }
}

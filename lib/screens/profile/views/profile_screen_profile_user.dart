import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/assets/app_assets.dart';
import '../../../common/extensions/context.dart';
import '../../../theme/app_color.dart';
import '../bloc/profile_bloc.dart';

class ProfileScreenProfileUser extends StatelessWidget {
  const ProfileScreenProfileUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Column(
          children: [
            Container(
              height: 96,
              margin: const EdgeInsets.only(left: 16, right: 16, top: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 96,
                    width: 96,
                    child: state.profiles?.avatar == null ? CircleAvatar(
                      backgroundImage: AssetImage(state.profiles?.avatar ?? AppAssets.imageAvatar),
                    ) :  const CircleAvatar(
                      backgroundImage: AssetImage(AppAssets.imageAvatar),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(state.profiles?.name ?? '',
                          style: context.textTheme.bodySmall?.copyWith(
                              color: AppColors.textWhite,
                              fontSize: 24,
                              fontWeight: FontWeight.w700)),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(state.profiles?.phone ?? '(+84) - - - - ',
                          style: context.textTheme.bodySmall?.copyWith(
                              color: AppColors.textWhiteBlack,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(state.profiles?.email ?? '',
                          style: context.textTheme.bodySmall?.copyWith(
                              color: AppColors.textWhiteBlack,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                    ],
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

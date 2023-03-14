import '../../../blocs/authentication/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/assets/app_assets.dart';
import '../../../common/extensions/context.dart';
import '../../../common/widgets/d_wallet_button.dart';
import '../../../navigation/navigation.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: const EdgeInsets.only(top: 61, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Image(
            image: AssetImage(AppAssets.logoApp),
            height: 38,
            width: 64,
            fit: BoxFit.scaleDown,
          ),
          DWalletButton(
              onPressed: () {context
                  .read<AuthenticationCubit>()
                  .unsetUserLogged();
              context.navigator.pushNamed(AppRoutes.signOption);
              },
              buttonType: ButtonType.onlyIcon,
              imageIcon: AppAssets.iconSetting),
        ],
      ),
    );
  }
}

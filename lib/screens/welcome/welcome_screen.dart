import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/authentication/authentication_cubit.dart';
import '../../common/extensions/extensions.dart';
import '../../common/widgets/d_wallet_button.dart';
import '../../data/local/local_storage_key.dart';
import '../../navigation/navigation.dart';
import '../../theme/app_color.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: DWalletButton(
          onPressed: () {
            context
                .read<AuthenticationCubit>()
                .unsetToken(LocalStorageKey.accessToken);
            context.navigator.pushNamed(AppRoutes.signOption);
          },
          buttonType: ButtonType.onlyText,
              color: AppColors.buttonNeonGreen,
        )),
      ),
    );
  }
}

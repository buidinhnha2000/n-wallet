import 'package:flutter/material.dart';

import '../../../common/assets/app_assets.dart';
import '../../../common/extensions/extensions.dart';
import '../../../common/widgets/widgets.dart';
import '../../../l10n/l10n.dart';
import '../../../navigation/navigation.dart';
import '../../../theme/app_color.dart';

class SignUpPasswordStep extends StatelessWidget {
  const SignUpPasswordStep({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _TitlePasswordWidget(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    context.l10n.text_new_password_content,
                    style: context.textTheme.titleSmall?.copyWith(
                        color: Colors.black54,
                        fontSize: 15,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                _TextFormInputPasswordWidget(),
                const Spacer(),
                DWalletButton(
                    onPressed: () {
                      context.navigator.pushNamedAndRemoveUntil(
                          AppRoutes.signUpPasswordStep, (route) => false);
                    },
                    text: context.l10n.text_continue,
                    color: AppColors.buttonNeonGreen,
                    buttonType: ButtonType.onlyText),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TitlePasswordWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 0,
          child: DWalletButton(
              onPressed: () {
                context.navigator.pushNamedAndRemoveUntil(
                    AppRoutes.signUpNameStep, (route) => false);
              },
              color: Colors.white,
              buttonType: ButtonType.onlyIcon,
              imageIcon: AppAssets.iconBack),
        ),
        const Spacer(),
        Expanded(
            flex: 7,
            child: Text(
              context.l10n.text_new_password,
              style: context.textTheme.titleSmall?.copyWith(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ))
      ],
    );
  }
}

class _TextFormInputPasswordWidget extends StatefulWidget {
  @override
  State<_TextFormInputPasswordWidget> createState() =>
      _TextFormInputPasswordWidgetState();
}

class _TextFormInputPasswordWidgetState
    extends State<_TextFormInputPasswordWidget> {
  late final TextEditingController _textPasswordController;
  bool showPassword = false;

  @override
  void initState() {
    _textPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.text_password,
          style: context.textTheme.titleSmall
              ?.copyWith(color: Colors.black54, fontWeight: FontWeight.w400),
        ),
        DWalletTextField(
          keyboardType: TextInputType.text,
          controller: _textPasswordController,
          isPassword: !showPassword,
          suffixIcon: DWalletIconPassword(
            showPassword: showPassword,
            onPressed: () => setState(() {
              showPassword = !showPassword;
            }),
          ),
        ),
      ],
    );
  }
}

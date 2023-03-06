import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../common/assets/app_assets.dart';
import '../../../common/extensions/extensions.dart';
import '../../../common/widgets/widgets.dart';
import '../../../l10n/l10n.dart';
import '../../../navigation/navigation.dart';
import '../../../theme/app_color.dart';
import '../bloc/signup_bloc.dart';
import '../validation/validations.dart';

class SignUpNameStep extends StatefulWidget {
  const SignUpNameStep({
    super.key,
  });

  @override
  State<SignUpNameStep> createState() => _SignUpNameStepState();
}

class _SignUpNameStepState extends State<SignUpNameStep> {
  late final TextEditingController _textNameController;

  @override
  void initState() {
    _textNameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textNameController.dispose();
    super.dispose();
  }

  String? handleShowError(Name nameError) {
    if (nameError.pure || nameError.valid) {
      return '';
    }
    if (nameError.value.isEmpty) {
      return context.l10n.text_complete_all_info;
    }
    return context.l10n.text_email_invalidate;
  }

  void handleNavigationToPasswordStep(FormzInputStatus passwordStatus) {
    if (passwordStatus == FormzInputStatus.valid ||
        passwordStatus != FormzInputStatus.pure) {
      context.navigator.pushNamed(AppRoutes.signUpPasswordStep);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<SignUpBloc, SignUpState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _TitleNameStepWidget(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        context.l10n.text_your_name_content,
                        style: context.textTheme.titleSmall?.copyWith(
                            color: Colors.black54,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DWalletTextField(
                          controller: _textNameController,
                          hintText: context.l10n.text_your_name,
                          onChanged: (value) {
                            context
                                .read<SignUpBloc>()
                                .add(NameChanged(name: value));
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          handleShowError(state.name).toString(),
                          style: context.textTheme.titleSmall
                              ?.copyWith(color: Colors.red),
                        )
                      ],
                    ),
                    const Spacer(),
                    DWalletButton(
                        onPressed: () {
                          handleNavigationToPasswordStep(state.name.status);
                        },
                        text: context.l10n.text_continue,
                        color: AppColors.buttonNeonGreen,
                        buttonType: ButtonType.onlyText),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _TitleNameStepWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 0,
          child: DWalletButton(
              onPressed: () {
                context.navigator.pop(context);
              },
              color: Colors.white,
              buttonType: ButtonType.onlyIcon,
              imageIcon: AppAssets.iconBack),
        ),
        const Spacer(),
        Expanded(
            flex: 4,
            child: Text(
              context.l10n.text_your_name,
              style: context.textTheme.titleSmall?.copyWith(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ))
      ],
    );
  }
}

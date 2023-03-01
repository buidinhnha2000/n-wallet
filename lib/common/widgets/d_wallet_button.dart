import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/app_color.dart';
import '../extensions/context.dart';

enum ButtonType { onlyIcon, onlyText, iconAndText }

class DWalletButton extends StatelessWidget {
  const DWalletButton({
    Key? key,
    this.text,
    this.icon,
    required this.onPressed,
    this.color,
    required this.buttonType,
    this.imageIcon,
  }) : super(key: key);

  final IconData? icon;
  final Function()? onPressed;
  final Color? color;
  final ButtonType buttonType;
  final String? text;
  final String? imageIcon;

  Widget? handleShowChildElement(BuildContext context,
      {required ButtonType buttonType}) {
    Widget? widget;
    switch (buttonType) {
      case ButtonType.onlyIcon:
        widget = SvgPicture.asset(
          imageIcon ?? '',
        );
        break;
      case ButtonType.onlyText:
        widget = Text(
          text ?? '',
          style: context.textTheme.titleMedium?.copyWith(
            color: AppColors.textWhite,
            fontSize: 16,
          ),
        );
        break;
      case ButtonType.iconAndText:
        widget = _DWalletButtonIconAndTextWidget(
          imageIcon: imageIcon ?? '',
          text: text ?? '',
        );
        break;
    }
    return widget;
  }

  static const double _onlyIconSize = 40;

  double? handleChangeHeight() {
    const double defaultHeight = 56;

    if (buttonType == ButtonType.onlyIcon) {
      return _onlyIconSize;
    }
    return defaultHeight;
  }

  double? handleChangeWidth() {
    if (buttonType == ButtonType.onlyIcon) {
      return _onlyIconSize;
    }
    return null;
  }

  BorderSide handleShowBorderSide() {
    if (buttonType == ButtonType.onlyText) {
      return BorderSide.none;
    }
    return const BorderSide(color: AppColors.buttonBorder, width: 2);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: handleChangeHeight(),
      width: handleChangeWidth(),
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(8.0)),
          elevation: const MaterialStatePropertyAll(0),
          foregroundColor:
              MaterialStateProperty.all<Color>(AppColors.textWhite),
          backgroundColor: MaterialStateProperty.all<Color?>(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
             RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              side: handleShowBorderSide(),
            ),
          ),
        ),
        onPressed: () {
          onPressed?.call();
        },
        child: handleShowChildElement(context, buttonType: buttonType),
      ),
    );
  }
}

class _DWalletButtonIconAndTextWidget extends StatelessWidget {
  const _DWalletButtonIconAndTextWidget(
      {required this.text, required this.imageIcon});

  final String text;
  final String imageIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 38,
                width: 38,
                decoration: const BoxDecoration(
                    color: AppColors.buttonWhite,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: SvgPicture.asset(
                  imageIcon,
                  height: 18,
                  width: 9.34,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 8,
                child: Text(
                  text,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: AppColors.textBlack,
                    fontSize: 16,
                  ),
                ),
              ),
              // const Expanded(flex: 3, child: SizedBox())
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DWalletCardView extends StatelessWidget {
  const DWalletCardView({
    Key? key,
    this.backgroundColor,
    this.onTap,
    this.prefixIcon,
    this.suffixIcon,
    required this.child,
    this.style,
  }) : super(key: key);

  final Color? backgroundColor;
  final Function()? onTap;
  final String? prefixIcon;
  final String? suffixIcon;
  final Widget child;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor ?? Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Padding(
        padding: const EdgeInsets.all(19.0),
        child: GestureDetector(
          onTap: () {
            onTap?.call();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (prefixIcon != null) SvgPicture.asset(prefixIcon ?? ''),
                  const SizedBox(
                    width: 16,
                  ),
                  child,
                ],
              ),
              if (suffixIcon != null) SvgPicture.asset(suffixIcon ?? '')
            ],
          ),
        ),
      ),
    );
  }
}

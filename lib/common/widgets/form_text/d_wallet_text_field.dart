import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../common/extensions/context.dart';
import '../../../theme/app_color.dart';

class DWalletTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool isPassword;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;

  const DWalletTextField({
    Key? key,
    this.controller,
    this.prefixIcon,
    this.hintText,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.onChanged,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        cursorColor: AppColors.textLightBlack,
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        style: context.textTheme.bodyLarge?.copyWith(
            color: AppColors.textLightBlack,
            fontWeight: FontWeight.w400,
            fontSize: 16),
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: context.textTheme.bodyLarge
              ?.copyWith(color: AppColors.textLightBlack),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.buttonBorder, width: 2)),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.buttonBorder, width: 2)),
          labelStyle: const TextStyle(color: Colors.black54, fontSize: 16),
          suffixIcon: suffixIcon,
        ),
        onChanged: onChanged,
        inputFormatters: inputFormatters,
      ),
    );
  }
}

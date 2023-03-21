import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/assets/app_assets.dart';
import '../../../common/extensions/context.dart';
import '../../../l10n/l10n.dart';
import '../../../theme/app_color.dart';
import '../bloc/search_bloc.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      color: AppColors.backgroundGreen,
      height: 110,
      child: Padding(
        padding: const EdgeInsets.only(
            top: 60, left: 16, right: 16, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            SearchHeaderTextField(),
            SearchHeaderBack()
          ],
        ),
      ),
    );
  }
}

class SearchHeaderTextField extends StatelessWidget {
  const SearchHeaderTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    InputBorder border = const OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.buttonWhite,
        width: 1,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(16.0),
      ),
    );
    return Expanded(
      flex: 5,
      child: TextField(
        onChanged: (wordSearch) {
          context.read<SearchBloc>().add(LoadSearch(wordSearch));
        },
        style: context.textTheme.bodyMedium?.copyWith(
            color: AppColors.textLightBlack,
            fontWeight: FontWeight.w500,
            fontSize: 16),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 2),
          enabledBorder: border,
          focusedBorder: border,
          isDense: true,
          hintText: context.l10n.text_search_username_and_email,
          hintStyle: const TextStyle(
            fontSize: 16,
            color: AppColors.textLightBlack,
          ),
          prefixIcon: SvgPicture.asset(
            AppAssets.iconSearch,
            color: AppColors.textLightBlack,
            fit: BoxFit.scaleDown,
          ),
          prefixIconConstraints:
          const BoxConstraints(minWidth: 40, minHeight: 40),
          suffixIconConstraints:
          const BoxConstraints(minWidth: 40, minHeight: 40),
          filled: true,
          fillColor: AppColors.backgroundWhite,
        ),
      )
    );
  }
}

class SearchHeaderBack extends StatelessWidget {
  const SearchHeaderBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => context.navigator.pop(),
            child: Text(
              context.l10n.text_hide,
              style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.textWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/extensions/context.dart';
import '../../../l10n/l10n.dart';
import '../../../models/search/search_profile.dart';
import '../../../theme/app_color.dart';
import '../../transfer_confirm/bloc/transfer_confirm_bloc.dart';

class TransferBalanceScreenNotes extends StatelessWidget {
  const TransferBalanceScreenNotes({Key? key, this.searchProfile})
      : super(key: key);

  final SearchProfileJson? searchProfile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 300),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.text_transfer_content,
            style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.textBlack,
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            scrollPadding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 20 * 4),
            decoration: InputDecoration(
              hintText: searchProfile == null
                  ? context.l10n.text_notes
                  : '${searchProfile?.name?.toUpperCase()} ${context.l10n.text_transfer_content_des}',
              hintStyle: context.textTheme.bodyLarge
                  ?.copyWith(color: AppColors.textLightBlack),
              focusedBorder: const UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.buttonBorder, width: 2)),
              enabledBorder: const UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.buttonBorder, width: 2)),
            ),
            style: context.textTheme.bodyLarge
                ?.copyWith(color: AppColors.textLightBlack),
            onChanged: (notes) {
              context
                  .read<TransferConfirmBloc>()
                  .add(TransferNotesChanged(notes));
            },
          )
        ],
      ),
    );
  }
}

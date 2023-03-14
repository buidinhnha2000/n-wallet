import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/authentication/authentication_cubit.dart';
import '../../../common/extensions/extensions.dart';
import '../../../l10n/l10n.dart';
import '../../../models/models.dart';
import '../../../theme/app_color.dart';
import '../bloc/home_bloc.dart';

class HomeScreenUser extends StatelessWidget {
  const HomeScreenUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 24),
      height: 49,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<AuthenticationCubit, User?>(
                    builder: (context, state) {
                      return Text('${context.l10n.text_hello} ${state?.account?.name ?? ''}',
                          style: context.textTheme.bodySmall?.copyWith(
                              color: AppColors.textBlack,
                              fontSize: 18,
                              fontWeight: FontWeight.w700));
                    },
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(context.l10n.text_available_balance,
                      style: context.textTheme.bodySmall?.copyWith(
                          color: AppColors.textLightBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.w400))
                ],
              ),
              Text('\$${state.balances?.value ?? 0}',
                  style: context.textTheme.bodySmall?.copyWith(
                      color: AppColors.textBlack,
                      fontSize: 28,
                      fontWeight: FontWeight.w700)),
            ],
          );
        },
      ),
    );
  }
}

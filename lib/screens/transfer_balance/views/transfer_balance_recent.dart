import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/assets/app_assets.dart';
import '../../../../common/extensions/context.dart';
import '../../../../di/service_locator.dart';
import '../../../../l10n/l10n.dart';
import '../../../../theme/app_color.dart';
import '../../search/bloc/search_bloc.dart';

class TransferBalanceScreenRecent extends StatelessWidget {
  const TransferBalanceScreenRecent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      decoration: const BoxDecoration(
          color: AppColors.backgroundBlackLight,
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          TransferBalanceRecentTitle(),
          SizedBox(
            height: 16,
          ),
          TransferBalanceRecentList(),
          SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}

class TransferBalanceRecentTitle extends StatelessWidget {
  const TransferBalanceRecentTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            context.l10n.text_recent,
            style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.textBlack,
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              context.l10n.text_see_all_contact,
              style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.textNeonGreen,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}

class TransferBalanceRecentList extends StatelessWidget {
  const TransferBalanceRecentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 94,
      child: BlocProvider(
        create: (context) => SearchBloc(ServiceLocator.instance.inject()),
        child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: state.search?.profile?.length ?? 0,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final user = state.search?.profile![index];
                if (state.search != null) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 64,
                          width: 64,
                          child: CircleAvatar(
                              backgroundImage:
                              AssetImage(AppAssets.imageAvatar)),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          user?.name ?? '',
                          style: context.textTheme.bodyMedium?.copyWith(
                              color: AppColors.textBlack,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  );
                }
                return const Center(child: CircularProgressIndicator(color: Colors.amber,));
              },
            );
          },
        ),
      ),
    );
  }
}


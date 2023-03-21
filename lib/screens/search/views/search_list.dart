import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/assets/app_assets.dart';
import '../../../common/extensions/context.dart';
import '../../../navigation/navigation.dart';
import '../../../theme/app_color.dart';
import '../bloc/search_bloc.dart';

class SearchList extends StatelessWidget {
  const SearchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return ListView.builder(
          scrollDirection: Axis.vertical,
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 110),
          itemCount: state.search?.profile?.length ?? 0,
          itemBuilder: (context, index) {
            final user = state.search?.profile![index];
            if (state.search != null) {
              return GestureDetector(
                onTap: () {
                  context.navigator.pushNamed(AppRoutes.transferBalance,
                      arguments: state.search?.profile?[index]);
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 16, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 48,
                        width: 48,
                        child: CircleAvatar(
                            backgroundImage: AssetImage(AppAssets.imageAvatar)),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user?.name ?? '',
                            style: context.textTheme.bodyMedium?.copyWith(
                                color: AppColors.textBlack,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            user?.email ?? '',
                            style: context.textTheme.bodyMedium?.copyWith(
                                color: AppColors.textLightBlack,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }
            return const CircularProgressIndicator();
          },
        );
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../di/service_locator.dart';
import '../../theme/app_color.dart';
import 'bloc/search_bloc.dart';
import 'views/search_header.dart';
import 'views/search_list.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        body: BlocProvider(
          create: (context) => SearchBloc(ServiceLocator.instance.inject()),
          child: Stack(
            children: const [
              SearchList(),
              SearchHeader(),
            ],
          ),
        ),
      ),
    );
  }
}
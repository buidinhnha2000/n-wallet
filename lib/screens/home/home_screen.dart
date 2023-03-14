import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/assets/app_assets.dart';
import '../../common/widgets/bottom_navigator/bottom_navigator.dart';
import '../../common/widgets/bottom_navigator/cubit.dart';
import '../../theme/app_color.dart';
import '../welcome/welcome_screen.dart';
import 'bloc/home_bloc.dart';
import 'views/home_screen_header.dart';
import 'views/home_screen_main_action.dart';
import 'views/home_screen_payment_list.dart';
import 'views/home_screen_promo_discount.dart';
import 'views/home_screen_user.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = <Widget>[
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
      const WelcomeScreen(),
    ];
    return BlocProvider(
      create: (context) => BottomNavigationTabCubit(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: pages[context.read<BottomNavigationTabCubit>().state],
          bottomNavigationBar: BottomNavigationBarCustom(
            index: context.watch<BottomNavigationTabCubit>().state,
            onTap: context.read<BottomNavigationTabCubit>().changeTab,
          ),
          floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: AppColors.primaryOrange,
            onPressed: () {},
            child: SvgPicture.asset(AppAssets.iconQr),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        );
      }),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(context.read())..add(LoadHome()),
        ),
      ],
      child: Scaffold(
        body: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: const EdgeInsets.all(0),
          children: const [
            HomeScreenHeader(),
            HomeScreenUser(),
            HomeScreenMainAction(),
            HomeScreenPaymentList(),
            HomeScreenPromoDiscount()
          ],
        ),
      ),
    );
  }
}

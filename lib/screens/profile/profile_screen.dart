import 'views/profile_screen_card.dart';
import 'views/profile_screen_header.dart';
import 'views/profile_screen_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../theme/app_color.dart';
import 'bloc/profile_bloc.dart';
import 'views/profile_screen_profile_user.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProfileBloc(context.read())..add(LoadProfile()),
        child: ListView(
          padding: const EdgeInsets.all(0),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            Container(
              height: 414,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: AppColors.backgroundGreen,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32))),
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                      bottomRight: Radius.circular(32)),
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(0),
                  children: const [
                    ProfileScreenHeader(),
                    ProfileScreenProfileUser(),
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8, top: 24),
                      child: ProfileScreenCard(),
                    ),
                  ],
                ),
              ),
            ),
            const ProfileScreenSetting(),
          ],
        ),
      ),
    );
  }
}


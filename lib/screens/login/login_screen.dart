import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../common/extensions/extensions.dart';
import '../../navigation/navigation.dart';
import '../../theme/app_color.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child:  Text('Login', style: context.textTheme.titleMedium?.copyWith(
            color: Colors.black
          ),),
          onPressed: () {

            Navigator.pushNamedAndRemoveUntil(
                context, AppRoutes.home, (route) => false);
          },
        ),
      ),
    );
  }
}

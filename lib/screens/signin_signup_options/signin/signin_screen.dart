import 'package:flutter/material.dart';
import '../../../common/assets/app_assets.dart';
import '../../../navigation/navigation.dart';
import '../../../theme/app_color.dart';
import '../../widget/button/button_check.dart';
import '../../widget/button/button_option.dart';
import '../../widget/form_text/icon_show_password.dart';
import '../../widget/form_text/text_form.dart';
import '../../widget/form_text/validation_form.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          _topPage(),
          _bottomPage()
        ],
      ),
    );
  }

  Widget _topPage(){
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 73,
          ),
          child: const Image(
            image: AssetImage('assets/images/logo_app.png'),
            height: 120,
            width: 164,
            fit: BoxFit.scaleDown,
          ),
        ),
        const SizedBox(
          height: 53,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: TextForm(
            hintText: 'Your Email',
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
            validator: validatedEmail,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: TextForm(
              hintText: 'Password',
              keyboardType: TextInputType.text,
              controller: _passwordController,
              validator: passwordValidator,
              isPassword: true,
              suffixIcon: const IconShowPassword()
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  // Navigator.of(context)
                  //     .pushNamed(AppRoutes.forgotPassword);
                },
                child: Text(
                  'Forgot password?',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.primaryGreen,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: ButtonCheck(
                  onPressed: () {
                    return Future(() => null);
                  },
                  text: 'Login',
                  color: AppColors.buttonNeonGreen,
                  img: null),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'New to Wpay?',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.black45,
                  ),
                ),
                GestureDetector(
                  // onTap: () {Navigator.of(context).pushNamed(AppRoutes.signUp);},
                  child: Text(
                    'Sign Up',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(
                        color: AppColors.primaryGreen,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryGreen),
                  ),
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 150,
        ),
      ],
    );
  }
  Widget _bottomPage(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'or login with',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Colors.black45,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          height: 54,
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: ButtonOption(
                  onPressed: () {
                    return Navigator.of(context)
                        .pushNamed(AppRoutes.signIn);
                  },
                  text: 'Facebook',
                  color: null,
                  img: AppAssets.iconFacebook,
                ),
              ),
              const SizedBox(width: 16,),
              Expanded(
                flex: 1,
                child: ButtonOption(
                  onPressed: () {
                    return Navigator.of(context)
                        .pushNamed(AppRoutes.signIn);
                  },
                  text: 'Google',
                  color: null,
                  img: AppAssets.iconGoogle,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32,)
      ],
    );
  }

}

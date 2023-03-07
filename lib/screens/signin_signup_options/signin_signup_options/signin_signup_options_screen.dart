import 'package:flutter/material.dart';
import '../../../common/assets/app_assets.dart';
import '../../../common/extensions/context.dart';
import '../../../common/widgets/widgets.dart';
import '../../../l10n/l10n.dart';
import '../../../navigation/navigation.dart';
import '../../../theme/app_color.dart';

class SignInSignUpOption extends StatefulWidget {
  const SignInSignUpOption({Key? key}) : super(key: key);

  @override
  State<SignInSignUpOption> createState() => _SignInSignUpOptionState();
}

const curveHeight = 900.0;
const avatarRadius = curveHeight * 0.28;
const avatarDiameter = avatarRadius * 2;

class _SignInSignUpOptionState extends State<SignInSignUpOption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryGreen,
      body: Stack(
        children: [
          const CurvedShape(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 150,
                ),
                child: const Image(
                  image: AssetImage(AppAssets.imageIllustrations1),
                  height: 340,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                context.l10n.text_optionSign_1,
                style: context.textTheme.bodyLarge?.copyWith(
                    color: AppColors.textWhite,
                    fontSize: 28,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                context.l10n.text_optionSign_2,
                style: context.textTheme.bodyLarge?.copyWith(
                    color: AppColors.textWhite,
                    fontSize: 28,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: DWalletButton(
                  onPressed: () {
                    return Navigator.of(context).pushNamed(AppRoutes.signIn);
                  },
                  text: context.l10n.text_login,
                  color: AppColors.buttonNeonGreen,
                  buttonType: ButtonType.onlyText,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
                child: DWalletButton(
                  onPressed: () {
                    context.navigator.pushNamedAndRemoveUntil(
                        AppRoutes.signUpEmailStep, (route) => false);
                  },
                  text: context.l10n.text_signUp,
                  color: AppColors.primaryGreen,
                  buttonType: ButtonType.onlyText,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CurvedShape extends StatelessWidget {
  const CurvedShape({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: curveHeight,
      child: CustomPaint(
        painter: _MyPainter(),
      ),
    );
  }
}

class _MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double sizeScreen = 0.5;
    double width = 1.5;
    double height = 1.7;
    double rightHeight = 0.28;

    var paint = Paint();
    paint.color = AppColors.backgroundLightGreen;
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();
    path.moveTo(0, size.height * sizeScreen);
    path.quadraticBezierTo(size.width / width, size.height / height, size.width,
        size.height * rightHeight);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

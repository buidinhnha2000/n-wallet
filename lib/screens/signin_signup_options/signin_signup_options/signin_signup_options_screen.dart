import 'package:flutter/material.dart';
import '../../../common/assets/app_assets.dart';
import '../../../common/extensions/context.dart';
import '../../../l10n/l10n.dart';
import '../../../navigation/navigation.dart';
import '../../../theme/app_color.dart';
import '../../widget/button/button_check.dart';

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
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                context.l10n.text_optionSign_2,
                style: context.textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ButtonCheck(
                    onPressed: () {
                      return Navigator.of(context).pushNamed(AppRoutes.signIn);
                    },
                    text: context.l10n.text_login,
                    color: AppColors.buttonNeonGreen,
                    img: null),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
                child: ButtonCheck(
                    onPressed: () {
                      return Future(() => null);
                      // return Navigator.of(context).pushNamed(AppRoutes.signUp);
                      // return Navigator.pop(context);
                    },
                    text: context.l10n.text_signUp,
                    color: AppColors.primaryGreen,
                    img: null),
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
    var paint = Paint();
    paint.color = AppColors.backgroundLightGreen;
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();
    path.moveTo(0, size.height * 0.5);
    path.quadraticBezierTo(
        size.width / 1.5, size.height / 1.7, size.width, size.height * 0.28);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
